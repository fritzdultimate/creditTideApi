<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use App\Models\BlogCategory;

class BlogController extends Controller {
    public function getBlogs($category) {
        $blogs = BlogCategory::with(['blogs' => function($query) {
            $query->orderBy('created_at', 'desc');
        }])->where('category', $category)->first();

        return response()->json([
            'message' => $blogs,
            'done' => true
        ], 201);
    }

    public function getPost($slug) {
        $post = Blog::with('category')->where('slug', $slug)->first();

        return response()->json([
            'message' => $post,
            'done' => true
        ], 201);
    }

    public function love($id) {
        Blog::where('id', $id)->increment('love_count');

        return response()->json([
            'message' => 'liked',
            'done' => true
        ], 201);
    }

    public function unlove($id) {
        Blog::where('id', $id)->decrement('love_count');

        return response()->json([
            'message' => 'unliked',
            'done' => true
        ], 201);
    }

    public function getBlogCategories() {
        $categories = BlogCategory::all();

        return response()->json([
            'message' => $categories,
            'done' => true
        ], 201);
    }
}
