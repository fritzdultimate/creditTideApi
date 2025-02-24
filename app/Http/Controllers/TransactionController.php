<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Services\TransactionService;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    protected $transactionService;

    public function __construct(TransactionService $transactionService) {
        $this->transactionService = $transactionService;
    }

    public function transactions(Request $request) {
        $offset = $request->query('offset', 0);
        $limit = $request->query('limit', 10);
        $result = $this->transactionService->getTransactions($offset, $limit);

        return response()->json([
            'message' => $result['message'],
            'done' => $result['done']
        ], $result['code']);
    }

    public function getTransaction($id) {
        
    }
}
