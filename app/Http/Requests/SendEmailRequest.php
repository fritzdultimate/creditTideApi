<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SendEmailRequest extends FormRequest
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
            'email' => 'required|email',
            'message' => 'required|min:30',
            'firstname' => 'required|min:2',
            'lastname' => 'required|min:2',
            'subject' => 'required'       
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

            'message.required' => 'Write a descriptive message of your inquiry',
            'message.min' => 'At least 30 character long of message is required',

            'firstname.required' => 'Please provide a valid firstname',
            'firstname.min' => 'Firstname is too short',

            'lastname.required' => 'Please provide a valid lastname',
            'lastname.min' => 'Lastname is too short',

        ];
    }
}
