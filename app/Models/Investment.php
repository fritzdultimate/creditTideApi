<?php

namespace App\Models;

use App\Enums\InvestmentStatus;
use Illuminate\Database\Eloquent\Model;

class Investment extends Model {
    protected $fillable = [
        'user_id',
        'investment_plan_id',
        'stock_id',
        'amount',
        'current_value',
        'start_date',
        'end_date',
        'status',
        'created_at',
        'updated_at'
    ];

    protected $casts = [
        'status' => InvestmentStatus::class,
    ];

    public function user() {
        return $this->belongsTo(User::class);
    }
}
