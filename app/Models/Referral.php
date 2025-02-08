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
}
