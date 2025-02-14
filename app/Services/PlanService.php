<?php

namespace App\Services;

use App\Models\InvestmentPlan;

class PlanService {


    /**
     * Get all available investment plans
     * 
     * @return array
    */
    public function getPlans() {
        $plans = InvestmentPlan::all();

        return [
            'message' => $plans,
            'done' => true,
            'code' => 200
        ];
    } 
    
}
