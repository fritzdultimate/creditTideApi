<?php

namespace App\Http\Controllers;

use App\Models\Question;

class SurveyQuestionController extends Controller {
    public function getQuestions() {
        $questions = Question::with('answers')->get();

        return response()->json([
            'message' => $questions,
            'done' => true
        ], 201);
    }
}
