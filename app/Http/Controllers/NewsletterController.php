<?php

namespace App\Http\Controllers;

use App\Http\Requests\NewsletterRequest;
use App\Models\Newsletter;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class NewsletterController extends Controller {
    public function subscribe(NewsletterRequest $request): JsonResponse {
        Newsletter::create([
            'email' => $request->email
        ]);
        // send email

        return response()->json([
            'message' => 'Email subscribed!'
        ]);
    }

    public function unsubscribe(Request $request): JsonResponse {
        $newsletter = Newsletter::where('email', $request->email)->first();
        if($newsletter) {
            $newsletter->subscribed = false;
            $newsletter->save();
            // send email

            return response()->json([
                'message' => 'Email unsubscribed!'
            ]);
        }
        return response()->json([
            'message' => 'Email not found!'
        ], 404);
    }
}
