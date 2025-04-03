<?php

namespace App\Services;

use App\Mail\CustomMail;
use App\Models\PasswordResetToken;
use App\Models\User;
use App\Models\Referral;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

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
        return DB::transaction(function () use ($data) {
            $invitation_code = $data['code'];
            // Create the new user.
            $user = User::create([
                'username' => $data['username'],
                'email' => $data['email'],
                'password' => $data['password'],
                'dob'  => $data['dob'],
                'phone' => $data['phone'] ?? null,
                'invitation_code' => $this->generateUniqueInvitationCode(),
            ]);
            PasswordResetToken::where('email', $data['email'])->forceDelete(); // purposely deleted all tokens
            $token = rand(100000, 999999);
            $token = PasswordResetToken::create([
                'email' => $data['email'],
                'token' => $token
            ]);
            // send email
            $app_name = env('APP_NAME');
            $expires_at = Carbon::parse($token->created_at)->addHours(2);
            $data = [
                'view' => 'emails.auth.otp',
                'subject' => "[$app_name] OTP Verification",
                'email' => $token->email,
                'otp' => $token->token,
                'name' => ucfirst($user->lastname) . ' ' . ucfirst($user->firstname),
                'expires_at' => $expires_at->format('m/d/Y - g:i A')
            ];
            Mail::to($data['email'])->queue(new CustomMail($data));
            if (!empty($invitation_code)) {
                $referrer = User::where('invitation_code', $invitation_code)->first();
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
            Auth::login($user);

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

    /**
     * Create Verification token
     * 
     * @param string $email Email address to send the verification token to
     * 
     * @return PasswordResetToken
     */
    public function createVerificationToken (string $email): array {
        $user = User::where('email', $email)->first();
        if(!$user) {
            return [
                'message' => 'Email address is not registered with us.',
                'done' => false,
                'code' => 404
            ];
        }
        
        PasswordResetToken::where('email', $email)->forceDelete(); // purposely deleted all tokens
        $lastToken = PasswordResetToken::where('email', $email)->first();
        if($lastToken && !Carbon::parse($lastToken->created_at)->addHours(2)->isPast()) {
            return [
                'message' => 'We cannot resend you a verification code at this moment.',
                'done' => false,
                'code' => 400
            ];
        }
        $token = rand(100000, 999999);

        $token = PasswordResetToken::create([
            'email' => $email,
            'token' => $token
        ]);
        $app_name = env('APP_NAME');
        $expires_at = Carbon::parse($token->created_at)->addHours(2);
        $data = [
            'view' => 'emails.auth.otp',
            'subject' => "[$app_name] OTP Verification",
            'email' => $token->email,
            'otp' => $token->token,
            'name' => ucfirst($user->lastname) . ' ' . ucfirst($user->firstname),
            'expires_at' => $expires_at->format('m/d/Y - g:i A')
        ];
        Mail::to($data['email'])->queue(new CustomMail($data));

        return [
            'message' => 'Verification token sent to provided email address.',
            'done' => true,
            'code' => 201
        ];
    }

    /**
     * Verifies User email address
     * 
     * @param array $data {
     * 
     *  @type string    $email  User's email address
     *  @type string    $token  User's token to verify
     * }
     * 
     * @return array{message: string, done: string, code: string}
     */

    public function verifyEmail(array $data): array {
        $user = User::where('email', $data['email'])->first();
        if(!$user) {
            return [
                'message' => 'Account cannot be found.',
                'done' => false,
                'code' => 404
            ];
        }

        $token = PasswordResetToken::where([
            'email' => $data['email'],
            'token' => $data['token']
        ])->first();

        if(!$token) {
            return [
                'message' => "Token is expired, please click on resend email...",
                'done' => false,
                'code' => 404
            ];
        }

        if(Carbon::parse($token->created_at)->addHours(2)->isPast()) {
            return [
                'message' => 'Token is expired, please click on resend email',
                'done' => false,
                'code' => 400
            ];
        }

        User::where('email', $data['email'])->update([
            'email_verified_at' => now()
        ]);
        PasswordResetToken::where([
            'email' => $data['email'],
            'token' => $data['token']
        ])->forceDelete();

        return [
            'message' => 'Email verified',
            'done' => true,
            'code' => 200
        ];
    }
}
