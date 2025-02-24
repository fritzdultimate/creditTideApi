<?php

namespace App\Services;

use App\Models\Transaction;
use Illuminate\Support\Facades\Auth;

class TransactionService {


    /**
     * Get all transactions
     * 
     * @return array
    */
    public function getTransactions($offset, $limit) {
        $transactions = Transaction::where('user_id', Auth::id())
            ->orderBy('created_at', 'desc')
            ->offset($offset)
            ->limit($limit)
            ->get();

        return [
            'message' => $transactions,
            'done' => true,
            'code' => 200
        ];
    } 
    
}
