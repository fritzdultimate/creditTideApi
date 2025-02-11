<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    protected $registrationService;

    public function __construct() {
    }

    public function getUser() {
        $user = User::with('balance')->find(Auth::id());

        return response()->json([
            'user' => $user
        ], 201);
    }
}
