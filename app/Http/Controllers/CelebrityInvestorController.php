<?php

namespace App\Http\Controllers;

use App\Models\CelebrityInvestor;
use Illuminate\Http\JsonResponse;

class CelebrityInvestorController extends Controller {
    public function list(): JsonResponse {
        $investors = CelebrityInvestor::orderBy('priority', 'desc')->get();
        return response()->json($investors);
    }
}
