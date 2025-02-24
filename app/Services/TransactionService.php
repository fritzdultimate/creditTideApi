<?php

namespace App\Services;

use App\Models\Transaction;

class TransactionService {


    /**
     * Get all transactions
     * 
     * @return array
    */
    public function getTransactions() {
        $transactions = Transaction::all();

        return [
            'message' => $transactions,
            'done' => true,
            'code' => 200
        ];
    } 
    
}
