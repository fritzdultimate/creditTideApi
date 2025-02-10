<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegistrationRequest;
use App\Services\RegistrationService;
use Illuminate\Http\Request;

class RegistrationController extends Controller
{
    protected $registrationService;

    public function __construct(RegistrationService $registrationService) {
        $this->registrationService = $registrationService;
    }

    public function register(RegistrationRequest $request) {
        $data = $request->validated();

        try {
            if(!empty($request->register)) {
                $user = $this->registrationService->register($data);
                return response()->json([
                    'message' => 'User registered successfully!',
                    'user' => $user,
                ], 201);
            }
            return response()->json(['message' => 'data ok']);
            
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Registration failed.',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }

    public function resendVerification(Request $request) {
        try {
            $token = $this->registrationService->createVerificationToken($request->email);
            // send token to email

            return response()->json([
                'message' => "Email verification sent",
                'done' => true
            ], 201);

        } catch(\Exception $e) {
            return response()->json([
                'message' => 'Verification error.',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }

    public function verifyEmailAddress(Request $request) {
        try {
            $verified = $this->registrationService->verifyEmail([
                'email' => $request->email,
                'token' => $request->emailCode
            ]);

            return response()->json([
                'message' => $verified['message'],
                'done' => $verified['done']
            ], $verified['code']);
        } catch(\Exception $e) {
            return response()->json([
                'message' => 'Verification failed.',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }
}
