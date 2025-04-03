<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Referral extends Model {
    protected $fillable = [
        'user_id',
        'referrer_id',
        'level',
        'created_at',
        'updated_at'
    ];

    public function user() {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function referralUser() {
    return $this->belongsTo(User::class, 'referrer_id');
}
}
