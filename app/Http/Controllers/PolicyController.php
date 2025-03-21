<?php

namespace App\Http\Controllers;

use App\Models\Faq;
use App\Models\PolicyCategory;

class PolicyController extends Controller {
    public function getPolicy($category) {
        $policies = PolicyCategory::with('policies')->where('category', $category)->first();

        return response()->json([
            'message' => $policies,
            'done' => true
        ], 201);
    }

    public function getPolicyCategories() {
        $categories = PolicyCategory::all();

        return response()->json([
            'message' => $categories,
            'done' => true
        ], 201);
    }
}
