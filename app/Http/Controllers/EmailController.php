<?php

namespace App\Http\Controllers;

use App\Http\Requests\SendEmailRequest;
use Illuminate\Http\JsonResponse;

class NewsletterController extends Controller {
    public function sendEmail(SendEmailRequest $request): JsonResponse {
        
        // send email

        return response()->json([
            'message' => 'Email subscribed!'
        ]);
    }
}
