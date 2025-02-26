<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreWalletRequest;
use App\Services\UserWalletService;
use Illuminate\Http\Request;

class UserWalletController extends Controller
{
    protected $userWalletService;

    public function __construct(UserWalletService $userWalletService) {
        $this->userWalletService = $userWalletService;
    }

    public function getWallets() {
        $result = $this->userWalletService->getWallets();
        return response()->json([
            'message' => $result['message'],
            'done' => $result['done']
        ], $result['code']);
    }

    public function updateAddress(StoreWalletRequest $request) {
        $result = $this->userWalletService->updateWalletAddress([
            'address' => $request->address,
            'admin_wallet_id' => $request->admin_wallet_id
        ]);

        return response()->json([
            'message' => $result['message'],
            'done' => $result['done']
        ], $result['code']);
    }
}
