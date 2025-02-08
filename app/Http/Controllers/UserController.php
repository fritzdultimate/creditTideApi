<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    protected $registrationService;

    public function __construct() {
    }

    public function getUser() {
        $user = Auth::user();

        return response()->json([
            'user' => $user
        ], 201);
    }
}
