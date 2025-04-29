<?php

namespace App\Http\Controllers;

use App\Models\EmailLead;
use App\Models\User;
use Illuminate\Http\Request;

class EmailLeadsController extends Controller {
    public function extract(Request $request) {
        $emails = User::pluck('email')->toArray();

        dd(implode(',', $emails));
    }

    public function store() {
        $string =  "
            Adeelrehman123@yahoo.com,Adeelrehman714@gmail.com,b3913263@gmail.com,chukwuemekannamdi820@gmail.com,Eliteequityminers@gmail.com,fritzdultimate@gmail.com,habibaaliyah996@gmail.com,Habibataw006@gmail.com,Haseebmughal78600hm@Gmail.com,ikramarif0099@gmail.com,ikramarif0099@icloud.com,ikramkiani001@gmail.com,menirusomtochukwu42@gmail.com,mwaqasahmad342@gmail.com,patrickthaddeus01@gmail.com,qudoosgujjar47@gmail.com,rafiqamira945@gmail.com,sinopecpro@gmail.com,syedshahh53@gmail.com,williamemineimo@gmail.com,zayanrehman41@gmail.com
        ";

        $emails = explode(',', $string);

        foreach($emails as $email) {
            $leadExist = EmailLead::where('email', preg_replace('/\s+/', '', $email))->first();

            if(!$leadExist) {
                $lead = EmailLead::create([
                    'email' => preg_replace('/\s+/', '', $email)
                ]);
                $user = User::where('email', $email)->first();
                if($user) {
                    $lead->has_registered = true;
                    $lead->save();
                }
            }
            
        }
    }
}
