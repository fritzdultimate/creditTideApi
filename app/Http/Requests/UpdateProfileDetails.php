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
            'profile_picture' => 'nullable|image|mimes:jpg,jpeg,png|max:10240',
            'firstname' => 'required|min:3|max:20|alpha_dash',
            'lastname' => 'required|min:3|max:20|alpha_dash'
        ];
    }

    public function messages() {
        return [
            'profile_picture.image' => 'Please upload a valid picture',
            'profile_picture.mimes' => 'Valid extionsions: jpg,jpeg,png',
            'profile_picture.size' => 'Profile picture is too large, max size - 10mb',

            'firstname.required' => 'Firstname is required.',
            'firstname.min' => 'Firstname is too short, minimum of 3 character is required',
            'firstname.alpha_dash' => 'Invalid name entered for firstname',

            'lastname.required' => 'Lastname is required.',
            'lastname.min' => 'Lastname is too short, minimum of 3 character is required',
            'lastname.alpha_dash' => 'Invalid name entered for lastname'
        ];
    }
}
