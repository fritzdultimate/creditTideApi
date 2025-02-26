<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DepositController extends Controller
{
    protected $depositController;

    public function __construct(depositController $depositController) {
        $this->depositController = $depositController;
    }

    public function invest(Request $request) {
        try {
            $invest = $this->depositController->invest([
                'user_id' => Auth::id(),
                'investment_plan_id' => $request->investment_plan_id,
                'stock_id' => $request->stock_id,
                'amount' => $request->amount,
                'token' => $request->token
            ]);
            return response()->json([
                'message' => $invest['message'],
                'done' => $invest['done'],
            ], $invest['code']);
            
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Investment failed.',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }
}
