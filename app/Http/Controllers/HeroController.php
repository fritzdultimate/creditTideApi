<?php

namespace App\Http\Controllers;

use App\Models\Hero;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class HeroController extends Controller {
    public function getHero(string $slug): JsonResponse {
        $hero = Hero::where('slug', $slug)->first();

        if (!$hero) {
            return response()->json(['message' => 'Hero section not found'], 404);
        }

        return response()->json($hero);
    }
}
