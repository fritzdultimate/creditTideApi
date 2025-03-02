<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegistrationRequest;
use App\Models\User;
use App\Services\RegistrationService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
                'message' => $token['message'],
                'done' => $token['done']
            ], $token['code']);

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

    public function changePassword(Request $request) {
        $user = User::where('email', $request->email)->first();
        if(!$user) {
            return response()->json([
                'message' => 'Access denied, permission issue.',
                'done' => false
            ], 400);
        }

        $request->validate([
            'password' => 'required|min:8|max:30|confirmed',
        ]);
        $user->password = $request->password;
        $user->save();

        DB::table('sessions')
            ->where('user_id', $user->id)
            ->delete();

        return response()->json([
            'message' => 'Password Change successfully',
            'done' => true
        ], 200);
    }
}
