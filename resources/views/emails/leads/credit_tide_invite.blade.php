@extends('emails.layouts.app')

@section('content')
    <tr>
        <td style="padding-bottom: 10px; font-size: 14px; font-family: 'Inter', sans-serif; color: #a4a3ad;">
            <span class="im">
                <h3 class="m_-3852285001892450277transactions-paragraph">
                    📈 Ready to Start Compounding Your Profits Daily?
                </h3>
            </span>
            <p style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(13, 13, 14); font-family: 'Inter', sans-serif;">Hello <strong>Friend</strong>,</p>

            <p style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(13, 13, 14); font-family: 'Inter', sans-serif;">
                Imagine turning your savings into daily compounding profits, starting with as little as a few dollars.
            </p>

            <p style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(13, 13, 14); font-family: 'Inter', sans-serif;">
                At <strong>Credit Tide Stocks</strong>, we're helping people like you grow wealth passively through strategic stock investments, with returns compounding daily — from 3 to 12 months!
            </p>

            <p style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(13, 13, 14); font-family: 'Inter', sans-serif;">
                🎁 <strong>Limited-Time Offer:</strong> Join through this link and get early access + referral bonuses: <br>
                <a href="{{ $data['affiliateLink'] }}">Join Credit Tide Now</a>
            </p>

            <p style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(13, 13, 14); font-family: 'Inter', sans-serif;">
                This isn’t hype. It’s structured, tested, and working. Come invest smartly, and let your money work for you.
            </p>

            <p style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(13, 13, 14); font-family: 'Inter', sans-serif;">
                See you inside,
            </p>
            <div style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(13, 13, 14); font-family: 'Inter', sans-serif;">
                
                Warmest regards,<br>
                Oliver Prill<br>
                Chief Executive Officer<br>
                Credit Tide Stock Company<br>
                📧 support@credittidestockcompany.com
            </div>
        </td>
    </tr>
@endsection