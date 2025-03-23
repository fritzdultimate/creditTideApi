<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Blog extends Model {
    protected $fillable = [
        'blog_category_id',
        'title',
        'thumbnail',
        'content',
        'slug',
        'author',
        'author_picture',
        'love_count',
        'order',
        'created_at',
        'updated_at'
    ];

    public function category() {
        return $this->belongsTo(BlogCategory::class, 'blog_category_id');
    }
    public static function boot() {
        parent::boot();
        static::creating(function ($post) {
            $post->slug = Str::slug($post->title);
        });
    }
}
