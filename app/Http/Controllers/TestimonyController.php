<?php

namespace App\Http\Controllers;

use App\Models\Hero;
use App\Models\Testimony;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class TestimonyController extends Controller {
    public function list(): JsonResponse {
        $testimonies = Testimony::all();
        return response()->json($testimonies);
    }
}
