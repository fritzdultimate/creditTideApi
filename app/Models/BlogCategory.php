<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BlogCategory extends Model {
    protected $fillable = [
        'category',
        'is_active',
        'created_at',
        'updated_at'
    ];

    public function blogs() {
        return $this->hasMany(Blog::class);
    }
}
