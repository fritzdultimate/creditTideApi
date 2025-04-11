<?php

namespace App\Http\Controllers;

use App\Models\Stock;
use Illuminate\Support\Facades\Http;

class ThirdPartyController extends Controller {

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
