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

    public function stock() {
        return $this->belongsTo(Stock::class);
    }

    public function plan() {
        return $this->belongsTo(InvestmentPlan::class, 'investment_plan_id');
    }

    public function interests() {
        return $this->hasMany(Interest::class);
    }
}
