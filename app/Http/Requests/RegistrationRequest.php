<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegistrationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array {
        return [
            'email' => 'required|email|unique:users,email,except,id',
            'username' => 'required|min:3|max:50|unique:users,username,except,id|alpha_num',
            'password' => 'required|string|min:8',
            'dob' => 'required|date',
            'phone' => 'nullable|string',
            'code' => 'nullable|string|exists:users,invitation_code',
            'language' => 'nullable|string'
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array<string, string>
     */
    public function messages(): array {
        return [
            'email.required' => 'Email address is required.',
            'email.email' => 'Please provide a valid email address.',
            'email.unique' => 'Email address is already register for another user.',

            'username.required' => 'Username is required.',
            'username.min' => 'Username must be at least 3 characters long.',
            'username.unique' => 'Username is already taken.',
            'username.max' => 'Username is too damn long, TF.',
            'username.alpha_num' => 'Username can only be alpha numeric.',

            'password.required' => 'Password is required.',
            'password.string' => 'Password must be a mix of lower and upper case, and at least a number.',
            'password.min' => 'Password must be at least 8 characters long.',

            'dob.required' => 'Your date of birth is required.',
            'dob.date' => 'Your date of bith is not a valid date.',

            'phone.string' => 'Invalid phone number.',

            'code.string' => 'Invalid referral code.',
            'code.exists' => 'Invalid referral code.'

        ];
    }
}
