<?php

namespace App\Services;

use App\Enums\TransactionStatus;
use App\Mail\CustomMail;
use App\Models\Balance;
use App\Models\Investment;
use App\Models\InvestmentPlan;
use App\Models\PasswordResetToken;
use App\Models\ReferralBonus;
use App\Models\Stock;
use App\Models\Transaction;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class InvestmentService {


    /**
     * Create Investment for user
     * 
     * @param array $data {
     * 
     *  @type number    $user_id  User's ID
     *  @type number    $investment_plan_id  Plan ID
     *  @type number    $stock_id  Stock ID
     *  @type number    $amount  Investment initial amount
     *  @type number    $token  Token to verify user before proceeding (OPTIONAL)
     * }
     * 
     * @return array{message: string, done: string, code: string}
     */

    public function invest(array $data) {
        $user = User::find($data['user_id']);
        if(!$user) {
            return [
                'message' => 'Something went wrong.',
                'done' => false,
                'code' => 404
            ];
        }
        $investmentPlan = InvestmentPlan::find($data['investment_plan_id']);
        $stock = Stock::find($data['stock_id']);

        if(!$investmentPlan) {
            return [
                'message' => 'Investment plan is required, please choose one.',
                'done' => false,
                'code' => 404
            ];   
        }

        if(!$stock) {
            return [
                'message' => 'Please choose a stock to invest on.',
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
        if($user->balance->balance < $data['amount']) {
            return [
                'message' => "Insufficient balance.",
                'done' => false,
                'code' => 404
            ];
        }

        if($investmentPlan->min_amount > $data['amount'] || $investmentPlan['max_amount'] < $data['amount']) {
            return [
                'message' => 'Investment amount out of range, please review and try again.',
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
                'expires_at' => $expires_at->format('m/d/Y - g:i A'),
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

            // Create investment now
            $reference = $this->generatePaymentReference();
            $investment = Investment::create([
                'user_id' => $data['user_id'],
                'investment_plan_id' => $data['investment_plan_id'],
                'stock_id' => $data['stock_id'],
                'amount' => $data['amount'],
                'current_value' => $data['amount'],
                'start_date' => now(),
                'reference' => $reference
            ]);

            if($investment) {
                Balance::where('user_id', $investment->user->id)->decrement('balance', $data['amount']);
                Balance::where('user_id', $investment->user->id)->increment('locked_balance', $data['amount']);

                // send email
                $app_name = env('APP_NAME');
                $data = [
                    'view' => 'emails.investment.active',
                    'subject' => "[$app_name] New Investment Created",
                    'email' => $investment->user->email,
                    'amount' => $investment->amount,
                    'username' => $investment->user->username,
                    'stock' => $investment->stock->name,
                    'plan' => $investment->plan->name,
                    'date' => $investment->created_at,
                ];
                Mail::to($data['email'])->queue(new CustomMail($data));

                $transaction = Transaction::create([
                    'user_id' => $investment->user->id,
                    'type' => 'investment',
                    'status' => TransactionStatus::ACTIVE,
                    'amount' => $data['amount'],
                    'reference' => $reference
                ]);

                // IF USER IS REFERRED BY ANOTHER USER
                if($investment->user->referredBy) {
                    $referred_by = $investment->user->referredBy;
                    $plan_bonus = floatval($investment->plan->referral_bonus ?? 0);
                    DB::transaction(function () use ($referred_by, $investment, $plan_bonus) {
                        $bonus = $investment->amount * 0.01 * $plan_bonus;
                        $referralBonus = ReferralBonus::firstOrCreate([
                            'user_id' => $referred_by->id,
                            'referred_user_id' => $investment->user->id,
                        ], [
                            'bonus' => $investment->amount * 0.01 * $plan_bonus,
                            'investment_id' => $investment->id,
                        ]);
    
                        if($referralBonus->wasRecentlyCreated) {
                            Transaction::create([
                                'user_id' => $referred_by->id,
                                'type' => 'referral_bonus',
                                'status' => TransactionStatus::COMPLETED,
                                'amount' => $bonus,
                                'reference' => $this->generatePaymentReference()
                            ]);
                            Balance::where('user_id', $referred_by->id)->increment('balance', $bonus);
                            // send email
                            $app_name = env('APP_NAME');
                            $data = [
                                'view' => 'emails.investment.bonus',
                                'subject' => "[$app_name] 🎉 You’ve just earned a referral bonus!",
                                'email' => $referred_by->email,
                                'username' => $referred_by->username,
                                'bonus' => $bonus,
                                'invited_username' => $investment->user->username,
                                'date' => $referralBonus->created_at,
                            ];
                            Mail::to($data['email'])->queue(new CustomMail($data));
                        }
                    });
                }

                PasswordResetToken::where([
                    'email' => $user->email,
                    'token' => $token->token
                ])->forceDelete();

                return [
                    'message' => $transaction->id,
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
