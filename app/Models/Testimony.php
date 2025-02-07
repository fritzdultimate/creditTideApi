<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Testimony extends Model {
    protected $fillable = ['name', 'position', 'testimony', 'image', 'created_at', 'updated_at'];
}
