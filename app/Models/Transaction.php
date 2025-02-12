<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model {
    protected $fillable = [
        'user_id',
        'type',
        'status',
        'amount',
        'reference',
        'created_at',
        'updated_at'
    ];

    public function user() {
        $this->belongsTo(User::class);
    }
}
