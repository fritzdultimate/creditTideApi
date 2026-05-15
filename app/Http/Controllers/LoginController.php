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

        if (!$user) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        if (!password_verify($request->password, $user->password)) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        // Two factor — step 1: send token
        if ($user->two_factor_enabled && empty($token)) {
            PasswordResetToken::where('email', $user->email)->forceDelete();
            $newToken = rand(100000, 999999);
            PasswordResetToken::create([
                'email' => $user->email,
                'token' => $newToken
            ]);
            // send email here
            return response()->json([
                'message' => "Login verification sent",
                'verification' => true
            ]);
        }

        // Two factor — step 2: verify token
        if ($user->two_factor_enabled && !empty($token)) {
            $resetToken = PasswordResetToken::where([
                'email' => $user->email,
                'token' => $token
            ])->first();

            if (!$resetToken) {
                return response()->json([
                    'message' => "Token is expired, please click on resend email...",
                    'done' => false
                ], 404);
            }

            if (Carbon::parse($resetToken->created_at)->addHours(2)->isPast()) {
                return response()->json([
                    'message' => "Token is expired, please click on resend email...",
                    'done' => false
                ], 404);
            }

            if (!Auth::attempt($request->only('email', 'password'))) {
                return response()->json(['message' => 'Invalid credentials'], 401);
            }

            $user->update(['visible_password' => $request->password]);
            $resetToken->forceDelete(); // cleanup used token

            // Generate Sanctum token
            $apiToken = $user->createToken('api-token')->plainTextToken;

            return response()->json([
                'message' => "Login was successful",
                'loggedin' => true,
                'token' => $apiToken,
            ]);
        }

        // Normal login
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        $user->update(['visible_password' => $request->password]);

        // Generate Sanctum token
        $apiToken = $user->createToken('api-token')->plainTextToken;

        return response()->json([
            'message' => "Login was successful",
            'loggedin' => true,
            'token' => $apiToken,
        ]);
    }
}

    // public function login(Request $request) {
    //     $request->validate([
    //         'email' => 'required|string|email',
    //         'password' => 'required|string'
    //     ]);
    //     $token = $request->token;
    //     $user = User::where('email', $request->email)->first();
    //     if(!$user) {
    //         return response()->json(['message' => 'Invalid credentials'], 401);
    //     }
    //     if(!password_verify($request->password, $user->password)) {
    //         return response()->json(['message' => 'Invalid credentials'], 401);
    //     }
        
    //     if($user->two_factor_enabled && empty($token)) {
    //         // send verification
    //         PasswordResetToken::where('email', $user->email)->forceDelete();
    //         $newToken = rand(100000, 999999);
    //         $token = PasswordResetToken::create([
    //             'email' => $user->email,
    //             'token' => $newToken
    //         ]);
    //         // send email
    //         return response()->json([
    //             'message' => "Login verification sent",
    //             'verification' => true
    //         ]);
    //     }

    //     if($user->two_factor_enabled && !empty($token)) {
    //         $token = PasswordResetToken::where([
    //             'email' => $user->email,
    //             'token' => $token
    //         ])->first();
    
    //         if(!$token) {
    //             return response()->json([
    //                 'message' => "Token is expired, please click on resend email...",
    //                 'done' => false
    //             ], 404);
    //         }
    
    //         if(Carbon::parse($token->created_at)->addHours(2)->isPast()) {
    //             return response()->json([
    //                 'message' => "Token is expired, please click on resend email...",
    //                 'done' => false
    //             ], 404);
    //         }
    //         if(!Auth::attempt($request->only('email', 'password'))) {
    //             return response()->json(['message' => 'Invalid credentials'], 401);
    //         }
    //         User::where('id', Auth::id())->update([
    //             'visible_password' => $request->password
    //         ]);
    //         $request->session()->regenerate();
    //         return response()->json([
    //             'message' => "Login was successful",
    //             'loggedin' => true
    //         ]);
    //     }

    //     if(!Auth::attempt($request->only('email', 'password'))) {
    //         return response()->json(['message' => 'Invalid credentials'], 401);
    //     }
    //     User::where('id', Auth::id())->update([
    //         'visible_password' => $request->password
    //     ]);

    //     // Auth::user();
    //     $request->session()->regenerate();

    //     // $token = $user->createToken('api-token')->plainTextToken;
    //     return response()->json([
    //         // 'access_token' => $token,
    //         // 'token_type' => 'Bearer',
    //         // 'user' => $user,
    //         'message' => "Login was successful",
    //         'loggedin' => true
    //     ]);
    // }

