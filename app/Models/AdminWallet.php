<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AdminWallet extends Model {
    protected $fillable = [
        'symbol',
        'name',
        'address',
        'coin',
        'path',
        'created_at',
        'updated_at'
    ];
}
