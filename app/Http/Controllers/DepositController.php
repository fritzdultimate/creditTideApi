<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Deposit;
use App\Services\DepositService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DepositController extends Controller
{
    protected $depositService;

    public function __construct(DepositService $depositService) {
        $this->depositService = $depositService;
    }

    public function deposit(Request $request) {
        try {
            $result = $this->depositService->deposit([
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
                'message' => 'Deposit failed.',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }

    public function getDeposit($reference) {
        $deposit = Deposit::with(['userWallet.adminWallet'])->where([
            'user_id' => Auth::id(),
            'reference' => $reference
        ])->first();

        return response()->json([
            'message' => $deposit,
            'done' => true,
        ], 201);
    }
}
