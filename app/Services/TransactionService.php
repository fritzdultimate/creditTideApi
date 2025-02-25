<?php

namespace App\Services;

use App\Models\Transaction;
use Illuminate\Http\Request;
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

    public function getTransaction($id) {
        $transaction = Transaction::with('user')->where([
            'user_id' => Auth::id(),
            'id' => $id
        ])->first();

        return [
            'message' => $transaction,
            'done' => true,
            'code' => 200
        ];
    }

    public function getGroupedTransaction($perPage) {
        $transactions = Transaction::with('user')->where([
            'user_id' => Auth::id()
        ])->orderBy('created_at', 'desc')->paginate($perPage);

        return [
            'message' => $transactions,
            'done' => true,
            'code' => 200
        ];
    }
    
}
