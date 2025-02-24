<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Services\TransactionService;

class TransactionController extends Controller
{
    protected $transactionService;

    public function __construct(TransactionService $transactionService) {
        $this->transactionService = $transactionService;
    }

    public function transactions() {
        $result = $this->transactionService->getTransactions();

        return response()->json([
            'message' => $result['message'],
            'done' => $result['done']
        ], $result['code']);
    }
}
