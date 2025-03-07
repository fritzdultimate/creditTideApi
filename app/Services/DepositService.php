<?php

namespace App\Services;

use App\Enums\TransactionStatus;
use App\Models\Balance;
use App\Models\Deposit;
use App\Models\Investment;
use App\Models\InvestmentPlan;
use App\Models\PasswordResetToken;
use App\Models\Stock;
use App\Models\Transaction;
use App\Models\User;
use App\Models\UserWallet;
use Carbon\Carbon;
use Illuminate\Support\Str;

class DepositService {


    public function deposit(array $data) {
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
                'message' => "Minimum deposit is $50.",
                'done' => false,
                'code' => 404
            ];
        }
        if($data['amount'] > 500000) {
            return [
                'message' => "Maximum deposit is $500,000.",
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

            // Create investment now
            $deposit = Deposit::create([
                'user_id' => $data['user_id'],
                'user_wallet_id' => $data['user_wallet_id'],
                'status' => TransactionStatus::PENDING,
                'amount' => $data['amount'],
                'reference' => $this->generatePaymentReference(),
            ]);

            if($deposit) {
                // send email
                $transaction = Transaction::create([
                    'user_id' => $deposit->user->id,
                    'type' => 'deposit',
                    'status' => TransactionStatus::PENDING,
                    'amount' => $data['amount'],
                    'reference' => $deposit->reference
                ]);

                PasswordResetToken::where([
                    'email' => $user->email,
                    'token' => $data['token']
                ])->forceDelete();

                $deposit = Deposit::with(['userWallet.adminWallet'])->find($deposit->id);
                return [
                    'message' => $deposit,
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
