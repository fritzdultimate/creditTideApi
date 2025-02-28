<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePasswordRequest extends FormRequest
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
            'password' => 'current_password:web',
            'new_password' => 'required|confirmed|string|min:8|max:30'
        ];
    }

    public function messages() {
        return [
            'password.current_password' => 'Current password is incorrect'
        ];
    }
}
