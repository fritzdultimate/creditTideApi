<?php

namespace App\Http\Controllers;

use App\Http\Requests\SendEmailRequest;
use App\Mail\CustomMail;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Mail;

class EmailController extends Controller {
    public function sendEmail(SendEmailRequest $request): JsonResponse {
        // send email
        $data = [
            'view' => 'emails.admin.inquiry',
            'subject' => $request->subject,
            'sender' => $request->email,
            'email' => 'fritzdultimate@gmail.com',
            'message' => $request->message,
            'name' => ucfirst($request->lastname) . ' ' . ucfirst($request->firstname),
        ];
        Mail::to($data['email'])->queue(new CustomMail($data));

        return response()->json([
            'message' => 'Email inquiry sent!'
        ]);
    }
}
