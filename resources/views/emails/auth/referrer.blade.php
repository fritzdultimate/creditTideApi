@extends('emails.layouts.app')

@section('content')
    <tr>
        <td style="padding-bottom: 10px; font-size: 14px; font-family: 'Inter', sans-serif; color: #a4a3ad;">
            <span class="im">
                <h3 class="m_-3852285001892450277transactions-paragraph">
                    🎉 New Referral Alert
                </h3>
            </span>
            <p style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(13, 13, 14); font-family: 'Inter', sans-serif;">Hi {{ $data['username'] }},</p>

            <p style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(13, 13, 14); font-family: 'Inter', sans-serif;">
                Good news! A new user, {{ $data['invited_username'] }}, just signed up using your referral link.
            </p>

            <p style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(13, 13, 14); font-family: 'Inter', sans-serif;">
                Thank you for helping us grow the community! We value your support and look forward to rewarding you more as your referrals continue to succeed on our platform.
            </p>

            <p style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(13, 13, 14); font-family: 'Inter', sans-serif;">
                Thanks for spreading the word and helping grow our community!
            </p>

            <p style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(13, 13, 14); font-family: 'Inter', sans-serif;">
                Keep inviting and earn even more! 💰
            </p>
        </td>
    </tr>

    <tr>
        <td style="padding-bottom: 10px; font-size: ; background-color: #ffffff; padding-left:; padding-right: 2.5vw; width: 100%;">
            <table role="presentation" style="width: 100%; border: none; border-spacing: 0; padding: 5px 0px; border-radius: 0.5vw;">
                <tbody style="width:100%;">

                    <tr style="width: 100%;">
                        <td style="display: flex; justify-content:space-evenly; width:100%;">
                            <div style="display: inline-block; width: 100%; max-width: 50%; vertical-align: top; text-align: left; color: #a4a3ad;">
                                <div class="m_-3852285001892450277data-des">
                                   Username
                                </div>
                            </div>
                            <div style="max-width: 50%; vertical-align: top; padding-bottom: 20px; margin-left: auto; font-size: 12px;">
                                <div class="m_-3852285001892450277payment-value">
                                    {{ ucfirst($data['username']) }}
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr style="width: 100%;">
                        <td style="display: flex; justify-content:space-evenly; width:100%;">
                            <div style="display: inline-block; width: 100%; max-width: 50%; vertical-align: top; text-align: left; color: #a4a3ad;">
                                <div class="m_-3852285001892450277data-des">
                                   Invited User
                                </div>
                            </div>
                            <div style="max-width: 50%; vertical-align: top; padding-bottom: 20px; margin-left: auto; font-size: 12px;">
                                <div class="m_-3852285001892450277payment-value">
                                    {{ ucfirst($data['invited_username']) }}
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr style="width: 100%;">
                        <td style="display: flex; justify-content:space-evenly; width:100%;">
                            <div style="display: inline-block; width: 100%; max-width: 50%; vertical-align: top; text-align: left; color: #a4a3ad;">
                                <div class="m_-3852285001892450277data-des">
                                    Date &amp; time
                                </div>
                            </div>
                            <div style="max-width: 50%; vertical-align: top; padding-bottom: 20px; margin-left: auto; font-size: 12px;">
                                <div class="m_-3852285001892450277payment-value">
                                    {{ getDateString($data['date'], "DD-MM-YYYY") }} | {{ getTimeString($data['date'], "hh:mm A") }}

                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>
@endsection