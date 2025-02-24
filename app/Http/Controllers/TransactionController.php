<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

class TransactionController extends Controller
{
    protected $transaction;

    public function __construct(PlanService $planService) {
        $this->planService = $planService;
    }

    public function plans() {
        $result = $this->planService->getPlans();

        return response()->json([
            'message' => $result['message'],
            'done' => $result['done']
        ], $result['code']);
    }
}
