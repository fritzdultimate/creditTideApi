<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Hero extends Model {
    protected $fillable = ['slug', 'heading', 'title', 'subtitle', 'background_image'];
}
