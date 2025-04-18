<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Stock;
use App\Services\StockService;
use Illuminate\Support\Facades\Http;

class StockController extends Controller
{
    protected $stockService;

    public function __construct(StockService $stockService) {
        $this->stockService = $stockService;
    }

    public function stocks() {
        $result = $this->stockService->getStocks();

        return response()->json([
            'message' => $result['message'],
            'done' => $result['done']
        ], $result['code']);
    }
}
