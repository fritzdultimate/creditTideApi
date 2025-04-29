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
            spirosomto@gmail.com,fritzdultimate@gmail.com,spirosomto@gmail.com,bagzronnie@gmail.com,spirosomto@gmail.com,gichimo2000@gmail.com,apuoyosamuel4@gmail.com,spirosomto@gmail.com,spirosomto@gmail.com,spirosomto@gmail.com,oyugiwilson@gmail.com,simonmerikwa@yahoo.com,simonmerikwa@yahoo.com,spirosomto@gmail.com,joramwilberforce728@gmail.com,kahindi@kitsao.co.ke,simonmerikwa@yahoo.com,emmanueljuma2063@gmail.com,sakazawujustine@gmail.com,vicvincentsokumu@gmail.com,jkimani396@gmail.com,jomamatiwa@gmail.com,komakechgodfrey5@gmail.com,nicholasolela44@gmail.com,jamcosilwal@gmail.com,barasaedwin905@gmail.com,solomonamone@gmail.com,spirosomto@gmail.com,cilosteve2@gmail.com,bruvia96@gmail.com,bssemakula3@gmail.com,kmungoli2018@gmail.com,Onyebuchinwa22@gmail.com,constone411@gmail.com,otienoseda43@gmail.com,njorogeksimon328@gmail.com,Johnpossi138@gmail.com,m9283268@gmail.com,coraza@clonemoi.com,m9283268@gmail.com,johnnamon04@gmail.com,chagz41@gmail.com,franklinechagala@yahoo.com,mudanyasamson21@gmail.com,savastianowino6@gmail.com,calvozeugen2@gmail.com,dave.mwebesa@gmail.com,acellamkenneth123@gmail.com,paulndungu.1989@gmail.com,piusnix82@gmail.com,Somto200324@gmail.com,okellodenisebosco@gmail.com,suudajonnes@gmail.com,sveshnikovan@lordpopi.com,viagayawanda@gmail.com,kiizastephenbills@gmail.com,okurutvincent876@gmail.com,hanningtoneotienoowidi@gmail.com,hanningtoneotienoowidi@gmail.com,hamidukamya589@gmail.com,tusemerirweemma3@gmail.com,koirejamada9@gmail.com,ivanouma18@gmail.com,tumushabepatrick@gmail.com,mugwerijohn91@gmail.com,juliusanguria864@gmail.com,juliusanguria864@gmail.com,kilindaemilliano@gmail.com,nyokabidorcas70@gmail.com,Somto200324@gmail.com,trevolmark146@gmail.com,Josephmatsiko252@mail.com
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
