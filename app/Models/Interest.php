<?php

namespace App\Models;

use App\Enums\InvestmentStatus;
use Illuminate\Database\Eloquent\Model;

class Interest extends Model {
    protected $fillable = [
        'user_id',
        'investment_id',
        'amount_deposited',
        'interest',
        'balance_before',
        'balance_after',
        'transaction_id',
        'created_at',
        'updated_at'
    ];

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function investment() {
        return $this->belongsTo(Investment::class);
    }
}
