<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Company extends Model {
    protected $fillable = [
        'name', 
        'about',
        'url',
        'image',
        'created_at', 
        'updated_at'];
}
