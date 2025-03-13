<body>
    <!-- Subscribed -->
    <div class="email-container">
        <div class="header">Dey Play</div>
        <div class="body">
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
