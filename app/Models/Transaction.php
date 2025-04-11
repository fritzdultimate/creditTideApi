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
        return $this->belongsTo(User::class);
    }

    // public function investment() {
    //     return $this->hasOne(Investment::class, 'transaction_id', 'transaction_id');
    // }

    public function investment() {
        return $this->hasOne(Investment::class, 'reference', 'reference');
    }
    public function interest() {
        return $this->hasOne(Interest::class, 'transaction_id', 'reference');
    }
}
