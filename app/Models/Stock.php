<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Stock extends Model {
    protected $fillable = [
        'symbol',
        'price',
        'last_price',
        'icon',
        'name',
        'created_at',
        'updated_at'
    ];
}
