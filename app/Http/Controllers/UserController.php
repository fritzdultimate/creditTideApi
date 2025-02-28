<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdatePasswordRequest;
use App\Http\Requests\UpdateProfileDetailsRequest;
use App\Models\User;
use App\Services\UserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    protected $userService;

    public function __construct(UserService $userService) {
        $this->userService = $userService;
    }

    public function getUser() {
        $user = $this->userService->findUser(Auth::id());

        return response()->json([
            'user' => $user['message']
        ], 201);
    }

    public function updateProfileDetails(UpdateProfileDetailsRequest $request) {
        $data = [
            'firstname' => $request->firstname,
            'lastname' => $request->lastname,
        ];

        $update = $this->userService->updatedetails($data, Auth::id());

        if($request->hasFile('profile_picture')) {
            $user = Auth::user();
            $file = $request->file('profile_picture');
            $filename = 'profile_' . $user->id . '_' . time() . '.' . $file->getClientOriginalExtension();
            $filePath = $file->storeAs('uploads/profile/pictures', $filename, 'public');

            if ($user->profile_picture) {
                Storage::disk('public')->delete(str_replace('/storage/', '', $user->profile_picture));
            }
            User::where('id', $user->id)->update([
                'profile_picture' => "storage/{$filePath}"
            ]);
        }

        return response()->json([
            'message' => $update['message'],
            'done' => $update['done']
        ], $update['code']);
    }

    public function updatePassword(UpdatePasswordRequest $request) {
        User::where('id', Auth::id())->update([
            'password' => Hash::make($request->new_password)
        ]);

        $currentSessionId = session()->getId();
        if($request->logout_devices) {
            DB::table('sessions')
                ->where('user_id', Auth::id())
                ->where('id', '!=', $currentSessionId)
                ->delete();
        }

        return response()->json([
            'message' => "Password has been changed successfully.",
            'done' => true
        ], 201);
    }

    public function updatePreferences(Request $request) {
        $preference = $request->input('tag');
        User::where('id', Auth::id())->update([
            $preference => $request->$preference
        ]);
    }

    public function logout() {
        Auth::logout();
        return response()->json([
            'message' => "Account logged out.",
            'done' => true
        ], 201);
    }
}
