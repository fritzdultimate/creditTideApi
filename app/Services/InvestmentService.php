<?php

namespace App\Services;

use App\Models\PasswordResetToken;
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
        

        $token = PasswordResetToken::where([
            'email' => $data['email'],
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
