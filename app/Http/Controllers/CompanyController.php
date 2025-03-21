<?php

namespace App\Http\Controllers;

use App\Models\Company;
use Illuminate\Http\JsonResponse;

class CompanyController extends Controller {
    public function list(): JsonResponse {
        $companies = Company::all();
        return response()->json($companies);
    }
}
