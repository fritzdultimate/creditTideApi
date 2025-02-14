<?php

namespace App\Services;

use App\Models\Stock;

class StockService {


    /**
     * Get all available stocks
     * 
     * @return array
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
