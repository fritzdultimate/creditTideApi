<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SiteSetting extends Model {
    protected $fillable = [
        'email', 
        'phone',
        'whatsapp_number',
        'support_script',
        'location',
        'created_at', 
        'updated_at'
    ];
}
