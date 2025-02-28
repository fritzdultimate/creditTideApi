<?php

namespace App\Services;

use App\Models\User;

class UserService {


    /**
     * Get all transactions
     * 
     * @return array
    */
    public function findUser($id) {
        $user = User::with('balance')->find($id);

        return [
            'message' => $user,
            'done' => true,
            'code' => 200
        ];
    }

    public function updatedetails($data, $id) {
        $update = User::where([
            'id' => $id,
        ])
        ->update($data);

        if($update) {
            return [
                'message' => 'Your profile details were updated.',
                'done' => true,
                'code' => 201
            ];
        }
        return [
            'message' => 'Something went wrong while updating.',
            'done' => true,
            'code' => 400
        ];
    }
    
}
