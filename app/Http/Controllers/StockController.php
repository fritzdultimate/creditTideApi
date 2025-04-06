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

    public function getStockPrice() {
        $apiKey = '9MUL4NLN7H5TFTS8';

        $stocks = Stock::all();

        foreach($stocks as $stock) {
            $symbol = $stock->symbol;
            $url = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$symbol&interval=1min&apikey=$apiKey";
            $response = Http::get($url);

            if ($response->successful()) {
                $data = $response->json();
                $timeSeries = $data['Time Series (1min)'];

                $latestTime = array_key_first($timeSeries);
                $latestData = $timeSeries[$latestTime];

                // the opening price
                $stockPrice = $latestData['1. open'];

                $stock->last_price = $stock->price;
                $stock->price = $stockPrice;
                $stock->save();
                
            } else {
                // Handle the error if the API request failed
                return response()->json(['error' => 'Failed to fetch stock data'], 500);
            }
        }

        
    }
}
