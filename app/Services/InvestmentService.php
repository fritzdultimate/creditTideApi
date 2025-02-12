<?php

namespace App\Services;

use App\Models\Investment;
use App\Models\InvestmentPlan;
use App\Models\PasswordResetToken;
use App\Models\Stock;
use App\Models\User;
use Carbon\Carbon;

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

    public function invest(array $data): array {
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

        if(!$investmentPlan) {
            return [
                'message' => 'Please choose a stock to invest on.',
                'done' => false,
                'code' => 404
            ];   
        }
        if($user->balance->balance < $data['amount']) {
            return [
                'message' => 'Insufficient balance.',
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
                    'message' => 'Token is expired, please click on resend email',
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

            // Create investment now
            $investment = Investment::create([
                'user_id' => $data['user_id'],
                'investment_plan_id' => $data['investment_plan_id'],
                'stock_id' => $data['stock_id'],
                'amount' => $data['amount'],
                'current_value' => $data['amount'],
                'start_date' => now()
            ]);

            if($investment) {
                PasswordResetToken::where([
                    'email' => $user->email,
                    'token' => $data['token']
                ])->forceDelete();
                
                return [
                    'message' => 'Investment went successfully.',
                    'done' => true,
                    'code' => 201
                ];
            }
        }
    }
}
