<?php

namespace App\Http\Controllers;

use App\Models\BlogCategory;

class BlogController extends Controller {
    public function getBlogs($category) {
        $blogs = BlogCategory::with('blogs')->where('category', $category)->first();

        return response()->json([
            'message' => $blogs,
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
