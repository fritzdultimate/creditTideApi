<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Withdrawal extends Model {
    protected $fillable = ['user_id', 'user_wallet_id', 'amount', 'reference', 'status'];

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function userWallet() {
        return $this->belongsTo(UserWallet::class);
    }
}
