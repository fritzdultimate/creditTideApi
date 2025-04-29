<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EmailLead extends Model {
    protected $fillable = [
        'email',
        'has_registered',
        'email_sent',
        'created_at',
        'updated_at'
    ];

    public function answers() {
        return $this->hasMany(QuestionAnswer::class);
    }
}
