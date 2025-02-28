<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Services\UserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    protected $userService;

    public function __construct(UserService $userService) {
        $this->userService = $userService;
    }

    public function getUser() {
        $user = $this->userService->findUser(Auth::id());

        return response()->json([
            'user' => $user
        ], 201);
    }

    public function updateProfileDetails(Request $request) {
        $data = [
            'firstname' => $request->firstname,
            'lastname' => $request->lastname
        ];

        $update = $this->userService->updatedetails($data);

        return response()->json([
            'message' => $update['message'],
            'done' => $update['done']
        ], $update['code']);
    }
}
