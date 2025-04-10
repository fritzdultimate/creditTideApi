<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Investment;
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
            
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Investment failed. ',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }

    public function activeInvestments(Request $request) {
        $offset = $request->query('offset', 0);
        $limit = $request->query('limit', 3);

        $investments = Investment::where([
            'user_id' => Auth::id(),
            'status' => 'active'
        ])
            ->orderBy('created_at', 'desc')
            ->offset($offset)
            ->limit($limit)
            ->get();
        
        return response()->json([
            'message' => $investments,
        ], 200);
    }

    public function sumActiveInvestment(Request $request) {
        $type = $request->query('type', 'current_value');
        $sum = Investment::where([
            'user_id' => Auth::id(),
            'status' => 'acive'
        ])->sum($type);

        return response()->json([
            'message' => $sum,
        ], 200);
    }
}
