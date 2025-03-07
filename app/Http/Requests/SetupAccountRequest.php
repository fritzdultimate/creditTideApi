<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SetupAccountRequest extends FormRequest {
    // protected $stopOnFirstFailure = true;
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
            'firstname' => 'required|alpha_dash|min:3|max:20',
            'lastname' => 'required|min:3|max:20',
            'country' => 'required|string|min:2',
            'place_of_birth' => 'required|min:3',
            'residential_address' => 'required|min:10',
            'city' => 'required|min:3',
            'postal_code' => 'required|min:4',
            'occupation' => 'required|min:5'
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array<string, string>
     */
    public function messages(): array {
        return [

        ];
    }
}
