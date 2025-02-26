<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Services\DepositService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DepositController extends Controller
{
    protected $depositController;

    public function __construct(DepositService $depositController) {
        $this->depositController = $depositController;
    }

    public function deposit(Request $request) {
        try {
            $result = $this->depositController->deposit([
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
}
