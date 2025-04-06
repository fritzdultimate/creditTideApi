<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class InvestmentPlan extends Model {
    protected $fillable = [
        'name',
        'min_amount',
        'max_amount',
        'interest_rate',
        'interval',
        'duration',
        'referral_bonus',
        'created_at',
        'updated_at'
    ];

    // public function investments() {
    //     return $this->hasMany(Investment::class);
    // }
}
