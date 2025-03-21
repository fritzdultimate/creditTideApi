<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Policy extends Model {
    protected $fillable = [
        'policy_category_id',
        'heading',
        'sub_heading',
        'content',
        'order',
        'created_at',
        'updated_at'
    ];

    public function category() {
        return $this->hasOne(PolicyCategory::class);
    }
}
