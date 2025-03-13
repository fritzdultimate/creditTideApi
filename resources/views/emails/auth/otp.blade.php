@extends('emails.layouts.app')
@section('content')
    <style>
        .email-container {
            width: 100%;
            font-family: Arial, sans-serif;
        }
        .email-header {
            font-weight: 700;
            font-size: 1rem;
            margin-bottom: 16px;
            text-align: left;
        }
        .email-title {
            font-size: 1.5rem;
            font-weight: 600;
        }
        .email-body {
            font-weight: 400;
            line-height: 30px;
            font-size: 1rem;
        }
        .details {
            width: 100%;
            margin: auto;
            margin-bottom: 2rem;
            border-radius: 8px;
            background-color: #f0f6fe;
            padding: 16px;
            border: 1px solid red;
        }
        .otp-row {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #e1e1e1;
            padding-bottom: 1.5rem;
            font-size: 14px;
            color: #131212;
        }
        .otp-label {
            font-weight: 500;
        }
        .otp-value {
            font-weight: 300;
            text-align: right;
        }
    </style>
    
    <div class="email-container">
        <p class="email-header">Hello {{ $data['name'] }},</p>
        <h3 class="email-title">OTP Verification</h3>
        <p class="email-body">The details are shown below:</p>
        
        <div class="details">
            <div class="otp-row">
                <span class="otp-label">OTP</span>
                <span class="otp-value">{{ $data['otp'] }}</span>
            </div>
            <div class="otp-row" style="border-bottom: none; padding-top: 1.5rem;">
                <span class="otp-label">Expires at:</span>
                <span class="otp-value">11/24/2023 - 5:03 PM</span>
            </div>
        </div>
    </div>
@endsection