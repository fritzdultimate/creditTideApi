<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class CryptoController extends Controller {
    public function getPrice(Request $request) {
        $currency = $request->query('currency', 'bitcoin');

        $url = "https://api.coingecko.com/api/v3/simple/price?ids={$currency}&vs_currencies=usd&include_24hr_change=true";

        try {
            $response = Http::get($url);
            return response()->json($response->json(), 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to fetch crypto prices ' . $e->getMessage()], 500);
        }
    }
}
