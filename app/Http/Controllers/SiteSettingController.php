<?php

namespace App\Http\Controllers;

use App\Models\SiteSetting;
use Illuminate\Http\JsonResponse;

class SiteSettingController extends Controller {
    public function getSetting(): JsonResponse {
        $setting = SiteSetting::select([
            'phone',
            'location',
            'whatsapp_number',
            'email',
            'support_script'
        ])->first();

        return response()->json([
            'message' => $setting
        ]);
    }
}
