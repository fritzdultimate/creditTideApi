<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class QuestionAnswer extends Model {
    protected $fillable = [
        'question_id',
        'answer',
        'created_at',
        'updated_at'
    ];

    public function question() {
        return $this->belongsTo(Question::class);
    }
}
