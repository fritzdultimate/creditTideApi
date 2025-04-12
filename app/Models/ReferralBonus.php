<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ReferralBonus extends Model {
    protected $fillable = [
        'user_id',
        'referred_user_id',
        'investment_id',
        'bonus',
        'created_at',
        'updated_at'
    ];

    public function referrer() {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function referredUser() {
        return $this->belongsTo(User::class, 'referred_user_id');
    }

    public function investment() {
        return $this->belongsTo(Investment::class, 'investment_id');
    }
}
