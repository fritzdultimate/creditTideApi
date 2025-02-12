<?php

namespace App\Services;

use App\Models\Stock;

class StocksService {


    /**
     * Get all available stocks
     * 
     * @return Stocks
    */


    public function getStocks() {
        $stocks = Stock::all();

        return [
            'message' => $stocks,
            'done' => true,
            'code' => 200
        ];
    } 
    
}
