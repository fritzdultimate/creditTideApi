<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PolicyCategory extends Model {
    protected $fillable = [
        'category',
        'is_active',
        'created_at',
        'updated_at'
    ];

    public function policies() {
        return $this->hasMany(Policy::class);
    }
}
