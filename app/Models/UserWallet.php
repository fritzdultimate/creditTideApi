<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserWallet extends Model {
    protected $fillable = [
        'address',
        'admin_wallet_id',
        'user_id',
        'created_at',
        'updated_at'
    ];

    public function adminWallet() {
        return $this->belongsTo(AdminWallet::class);
    }

    public function user() {
        return $this->belongsTo(User::class);
    }
}
