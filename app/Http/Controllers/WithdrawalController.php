<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Services\WithdrawalService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WithdrawalController extends Controller
{
    protected $withdrawalService;

    public function __construct(WithdrawalService $withdrawalService) {
        $this->withdrawalService = $withdrawalService;
    }

    public function withdraw(Request $request) {
        try {
            $result = $this->withdrawalService->withdraw([
                'user_id' => Auth::id(),
                'user_wallet_id' => $request->user_wallet_id,
                'amount' => $request->amount,
                'token' => $request->token
            ]);
            return response()->json([
                'message' => $result['message'],
                'done' => $result['done'],
            ], $result['code']);
            
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Withdrawal failed.',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }
}
