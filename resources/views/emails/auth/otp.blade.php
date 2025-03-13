<body style="font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;">
    <!-- Subscribed -->
    <div class="email-container" style=" max-width: 600px;
            margin: 20px auto;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <div class="header" style="background-color: #4a90e2;
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;">Dey Play</div>
        <div class="body" style="padding: 20px;
            color: #333;
            font-size: 16px;
            line-height: 1.5;">
            <p>Hi {{ ucfirst($data['name']) }},</p>
            <h3>Generation Succeeded</h3>
            <p>Your generation of <strong>${{ $data['otp'] }}</strong> was a success</p>
            <p>If you think this email was a mistake, please ignore.</p>
        </div>
        <div class="footer">
            &copy; {{ date('Y') }} {{ env('APP_NAME') }}. All rights reserved.
        </div>
    </div>
</body>
