<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Services\InvestmentService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class InvestmentController extends Controller
{
    protected $investmentService;

    public function __construct(InvestmentService $investmentService) {
        $this->investmentService = $investmentService;
    }

    public function invest(Request $request) {
        try {
            $invest = $this->investmentService->invest([
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
            return response()->json(['message' => 'data ok']);
            
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Registration failed.',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }
}
