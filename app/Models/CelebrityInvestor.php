<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CelebrityInvestor extends Model {
    // protected $table = 'celebrity_investors';
    protected $fillable = ['name', 'position', 'address', 'image', 'withdrawals', 'deposits', 'investments', 'created_at', 'updated_at', 'started_at'];
}
