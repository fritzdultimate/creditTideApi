<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Faq extends Model {
    protected $fillable = [
        'question',
        'answer',
        'category',
        'is_active',
        'created_at',
        'updated_at'
    ];

    public function answers() {
        return $this->hasMany(QuestionAnswer::class);
    }
}
