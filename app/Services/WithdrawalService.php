<?php

namespace App\Services;

use App\Enums\TransactionStatus;
use App\Mail\CustomMail;
use App\Models\PasswordResetToken;
use App\Models\Transaction;
use App\Models\User;
use App\Models\UserWallet;
use App\Models\Withdrawal;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class WithdrawalService {


    public function withdraw(array $data) {
        $user = User::find($data['user_id']);
        if(!$user) {
            return [
                'message' => 'Something went wrong.',
                'done' => false,
                'code' => 404
            ];
        }
        $userWallet = UserWallet::find($data['user_wallet_id']);
        if(!$userWallet) {
            return [
                'message' => 'Unknown wallet. Make sure to select a wallet.',
                'done' => false,
                'code' => 404
            ];
        }
        if(!is_numeric($data['amount'])) {
            return [
                'message' => "Invalid amount",
                'done' => false,
                'code' => 400
            ];
        }
        if($data['amount'] < 50) {
            return [
                'message' => "Minimum withdrawal is $50.",
                'done' => false,
                'code' => 404
            ];
        }
        if($data['amount'] > 500000) {
            return [
                'message' => "Maximum withdrawal is $500,000.",
                'done' => false,
                'code' => 404
            ];
        }

        if($user->balance->balance < $data['amount']) {
            return [
                'message' => "Insufficient balance.",
                'done' => false,
                'code' => 404
            ];
        }

        if(!$data['token']) {
            PasswordResetToken::where([
                'email' => $user->email,
            ])->forceDelete();
            $token = rand(100000, 999999);

            $token = PasswordResetToken::create([
                'email' => $user->email,
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

            return [
                'message' => 'Verification token sent to provided email address.',
                'done' => true,
                'code' => 201
            ];
        } else {
            $token = PasswordResetToken::where([
                'email' => $user->email,
                'token' => $data['token']
            ])->first();

            if(!$token) {
                return [
                    'message' => 'Invalid or expired token, please click on re-send OTP.',
                    'done' => false,
                    'code' => 404
                ];
            }

            if(Carbon::parse($token->created_at)->addHours(2)->isPast()) {
                return [
                    'message' => 'Invalid or expired token, please click on re-send OTP.',
                    'done' => false,
                    'code' => 400
                ];
            }

            $withdrawal = Withdrawal::create([
                'user_id' => $data['user_id'],
                'user_wallet_id' => $data['user_wallet_id'],
                'status' => TransactionStatus::PENDING,
                'amount' => $data['amount'],
                'reference' => $this->generatePaymentReference(),
            ]);

            if($withdrawal) {
                // send email
                $app_name = env('APP_NAME');
                $data = [
                    'view' => 'emails.withdrawal.request',
                    'subject' => "[$app_name] Withdrawal Initiated",
                    'email' => $withdrawal->user->email,
                    'symbol' => $withdrawal->userWallet->adminWallet->symbol,
                    'amount' => $withdrawal->amount,
                    'username' => $withdrawal->user->username,
                    'wallet' => $withdrawal->userWallet->adminWallet->name,
                    'reference' => $withdrawal->reference,
                    'date' => $withdrawal->created_at,
                ];
                Mail::to($data['email'])->queue(new CustomMail($data));

                $transaction = Transaction::create([
                    'user_id' => $withdrawal->user->id,
                    'type' => 'withdrawal',
                    'status' => TransactionStatus::PENDING,
                    'amount' => $data['amount'],
                    'reference' => $withdrawal->reference
                ]);

                PasswordResetToken::where([
                    'email' => $user->email,
                    'token' => $token->token
                ])->forceDelete();

                $withdrawal = Withdrawal::with(['userWallet.adminWallet'])->find($withdrawal->id);
                return [
                    'message' => $transaction,
                    'done' => true,
                    'code' => 201
                ];
            }
        }
    }
    protected function generatePaymentReference(): string {
        return 'INV-' . now()->timestamp . strtoupper(Str::random(6));
    }
}
