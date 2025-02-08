<?php

namespace App\Services;

use App\Models\User;
use App\Models\Referral;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class RegistrationService
{
    /**
     * Registers a new user and sets up referral relationships.
     *
     * @param array $data {
     *      @type string      $name             User's name.
     *      @type string      $email            User's email.
     *      @type string      $password         User's raw password.
     *      @type string      $dob              Date of birth (YYYY-MM-DD).
     *      @type string|null $phone            (Optional) Phone number.
     *      @type string|null $invitation_code  (Optional) Invitation code.
     * }
     *
     * @return \App\Models\User
     *
     * @throws \Exception
     */
    public function register(array $data): User {
        // Use a transaction so that if anything fails, all changes are rolled back.
        return DB::transaction(function () use ($data) {
            // Create the new user.
            $user = User::create([
                'username' => $data['username'],
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'dob'  => $data['dob'],
                'phone' => $data['phone'] ?? null,
                'invitation_code' => $this->generateUniqueInvitationCode(),
            ]);

            // If an invitation code was provided, try to locate the referring user.
            if (!empty($data['invitation_code'])) {
                $referrer = User::where('invitation_code', $data['invitation_code'])->first();
                if ($referrer) {
                    // Create a direct referral relationship.
                    Referral::create([
                        'user_id'     => $user->id,
                        'referrer_id' => $referrer->id,
                        'level'       => 1,
                    ]);

                    // Optionally, add referral links up to 5 levels deep.
                    $this->addReferralChain($referrer, $user);
                }
            }

            return $user;
        });
    }

    /**
     * Adds referral chain records for up to 5 levels deep.
     *
     * For example, if the referrer was also referred by someone, then that person
     * (and so on) gets credited at a deeper level.
     *
     * @param \App\Models\User $referrer
     * @param \App\Models\User $newUser
     * @param int              $maxDepth
     *
     * @return void
     */
    protected function addReferralChain(User $referrer, User $newUser, int $maxDepth = 5): void {
        $currentDepth   = 1;
        $currentReferrer = $referrer;

        while ($currentReferrer && $currentDepth < $maxDepth) {
            // Look for a referral record where the current referrer was referred by someone.
            $parentReferral = Referral::where('user_id', $currentReferrer->id)->first();
            if (!$parentReferral) {
                break; // No further upline.
            }

            // Add a referral record for the next level up.
            Referral::create([
                'user_id'     => $newUser->id,
                'referrer_id' => $parentReferral->referrer_id,
                'level'       => $currentDepth + 1,
            ]);

            // Move one level up.
            $currentReferrer = User::find($parentReferral->referrer_id);
            $currentDepth++;
        }
    }

    /**
     * Generates a unique invitation code.
     *
     * @return string
     */
    protected function generateUniqueInvitationCode(): string {
        do {
            $code = strtoupper(substr(md5(uniqid()), 0, 8));
        } while (User::where('invitation_code', $code)->exists());

        return $code;
    }
}
