<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\PasswordResetToken;
use App\Models\User;
use App\Services\RegistrationService;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    protected $registrationService;

    public function __construct(RegistrationService $registrationService) {
        $this->registrationService = $registrationService;
    }

    public function login(Request $request) {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string'
        ]);
        $token = $request->token;
        $user = User::where('email', $request->email)->first();
        if(!$user) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }
        if(!password_verify($request->password, $user->password)) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }
        
        if($user->two_factor_enabled && empty($token)) {
            // send verification
            PasswordResetToken::where('email', $user->email)->forceDelete();
            $newToken = rand(100000, 999999);
            $token = PasswordResetToken::create([
                'email' => $user->email,
                'token' => $newToken
            ]);
            // send email
            return response()->json([
                'message' => "Login verification sent",
                'verification' => true
            ]);
        }
        if($user->two_factor_enabled && !empty($token)) {
            $token = PasswordResetToken::where([
                'email' => $user->email,
                'token' => $token
            ])->first();
    
            if(!$token) {
                return response()->json([
                    'message' => "Token is expired, please click on resend email...",
                    'done' => false
                ], 404);
            }
    
            if(Carbon::parse($token->created_at)->addHours(2)->isPast()) {
                return response()->json([
                    'message' => "Token is expired, please click on resend email...",
                    'done' => false
                ], 404);
            }
            if(!Auth::attempt($request->only('email', 'password'))) {
                return response()->json(['message' => 'Invalid credentials'], 401);
            }
            $request->session()->regenerate();
            return response()->json([
                'message' => "Login was successful",
                'loggedin' => true
            ]);
        }

        if(!Auth::attempt($request->only('email', 'password'))) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        // Auth::user();
        $request->session()->regenerate();
        return response()->json([
            'message' => "Login was successful",
            'loggedin' => true
        ]);
    }
}
