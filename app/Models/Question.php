<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Question extends Model {
    protected $fillable = [
        'question',
        'type',
        'created_at',
        'updated_at'
    ];

    public function answers() {
        return $this->hasMany(QuestionAnswer::class);
    }
}
