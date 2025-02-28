<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProfileDetails extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array {
        return [
            'profile_picture' => 'nullable|image|mimes:jpg,jpeg,png|size:10',
        ];
    }

    public function messages() {
        return [
            'profile_picture.image' => 'Please upload a valid picture',
            'profile_picture.mimes' => 'Valid extionsions: jpg,jpeg,png',
            'profile_picture.size' => 'Profile picture is too large, max size - 10mb'
        ];
    }
}
