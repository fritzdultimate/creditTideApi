<?php

namespace App\Http\Controllers;

use App\Models\Faq;

class FaqController extends Controller {
    public function getFaqs() {
        $faqs = Faq::all();

        return response()->json([
            'message' => $faqs,
            'done' => true
        ], 201);
    }
}
