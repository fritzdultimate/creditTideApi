<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests\SetupAccountRequest;
use App\Http\Requests\UpdatePasswordRequest;
use App\Http\Requests\UpdateProfileDetailsRequest;
use App\Models\Investment;
use App\Models\Transaction;
use App\Models\User;
use App\Services\UserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserController extends Controller {
    protected $userService;
    protected function generatePaymentReference(): string {
        return 'INV-' . now()->timestamp . strtoupper(Str::random(6));
    }

    public function __construct(UserService $userService) {
        $investments = Investment::where('reference', null)->get();
        foreach($investments as $investment) {
            $reference = $this->generatePaymentReference();
            $investment->reference = $reference;
            $investment->save();

            Transaction::where([
                'user_id' => $investment->user->id,
                'amount' => $investment->amount,
                'type' => 'investment'
            ])->update([
                'reference' => $reference
            ]);
        }
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
            // $filePath = $file->storeAs('uploads/profile/pictures', $filename, 'public');
            $file->move(public_path('storage/uploads/profile/pictures'), $filename);

            if ($user->profile_picture) {
                $imagePath = public_path('storage/uploads/profile/pictures/' . $user->profile_picture);
                if (File::exists($imagePath)) {
                    File::delete($imagePath);
                }
            }
            User::where('id', $user->id)->update([
                'profile_picture' => "storage/uploads/profile/pictures/" . $filename
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

    public function setupaccount(SetupAccountRequest $request) {
        User::where('id', Auth::id())->update([
            'firstname' => $request->firstname,
            'lastname' => $request->lastname,
            'country' => $request->country,
            'city' => $request->city,
            'residential_address' => $request->residential_address,
            'place_of_birth' => $request->place_of_birth,
            'postal_code' => $request->postal_code,
            'occupation' => $request->occupation
        ]);
        return response()->json([
            'message' => "Account setup was completed",
            'done' => true
        ], 201);
    }

    

    public function logout() {
        auth()->guard('web')->logout();
        request()->session()->invalidate();
        request()->session()->regenerateToken();
        return response()->json([
            'message' => "Account logged out.",
            'done' => true
        ], 201);
    }
}
