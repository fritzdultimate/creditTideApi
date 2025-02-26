<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreWalletRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'address' => [
                'required',
                'string',
                'max:100',
                'regex:/^(0x[a-fA-F0-9]{40}|(1|3|bc1)[a-zA-HJ-NP-Z0-9]{25,39}|(0x)[a-fA-F0-9]{40}|T[a-zA-HJ-NP-Z0-9]{33}|ltc1[a-z0-9]{38,43}|M[a-km-zA-HJ-NP-Z1-9]{25,33}|L[a-km-zA-HJ-NP-Z1-9]{25,33})$/',
                Rule::unique('user_wallets', 'address'),
            ],
        ];
    }

    public function messages(): array
    {
        return [
            'address.regex' => 'The wallet address is not valid.',
            'address.unique' => 'This wallet address is already in use.',
        ];
    }
}

