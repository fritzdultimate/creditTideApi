<?php

namespace App\Services;

use App\Models\AdminWallet;
use App\Models\UserWallet;
use Illuminate\Support\Facades\Auth;

class UserWalletService {


    /**
     * Get all transactions
     * 
     * @return array
    */
    public function getWallets() {
        $this->createIfNotExist();
        $wallets = UserWallet::with('adminWallet')->where('user_id', Auth::id())
            ->get();

        return [
            'message' => $wallets,
            'done' => true,
            'code' => 200
        ];
    }

    public function updateWalletAddress($data) {
        $update = UserWallet::where([
            'user_id' => Auth::id(),
            'admin_wallet_id' => $data['admin_wallet_id']
        ])
        ->update([
            'address' => $data['address']
        ]);

        if($update) {
            return [
                'message' => 'Your wallet address has been updated successfully.',
                'done' => true,
                'code' => 201
            ];
        }
        return [
            'message' => 'Something went wrong while trying to perform the action.',
            'done' => true,
            'code' => 400
        ];
    } 

    private function createIfNotExist() {
        $adminWallets = AdminWallet::all();
        foreach($adminWallets as $adminWallet) {
            $userWallet = UserWallet::where([
                'user_id' => Auth::id(),
                'admin_wallet_id' => $adminWallet->id
            ])->first();

            if(!$userWallet) {
                UserWallet::create([
                    'user_id' => Auth::id(),
                    'admin_wallet_id' => $adminWallet->id
                ]);
            }

        }
    }
    
}
