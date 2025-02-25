<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Services\TransactionService;
use Carbon\Carbon;
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
        $result = $this->transactionService->getTransaction($id);
        return response()->json([
            'message' => $result['message'],
            'done' => $result['done']
        ], $result['code']);
    }

    public function getGroupedTransaction() {
        $result = $this->transactionService->getGroupedTransaction(20);
        $transactions = $result['message'];

        $grouped = collect($transactions->items())->groupBy(function ($transaction) {
            $date = Carbon::parse($transaction->created_at);
            if ($date->isToday()) {
                return 'Today';
            } elseif ($date->isYesterday()) {
                return 'Yesterday';
            } else {
                return $date->format('Y-m-d');
            }
        });

        return response()->json([
            'message' => $grouped,
            'pagination' => [
                'total' => $transactions->total(),
                'per_page' => $transactions->perPage(),
                'current_page' => $transactions->currentPage(),
                'last_page' => $transactions->lastPage(),
            ],
        ]);
    }
}
