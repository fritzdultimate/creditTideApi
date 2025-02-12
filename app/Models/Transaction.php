<?php

namespace App\Models;

use App\Enums\TransactionStatus;
use App\Enums\TransactionType;
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

    protected $casts = [
        'status' => TransactionStatus::class,
        'type' => TransactionType::class
    ];

    public function user() {
        $this->belongsTo(User::class);
    }
}
