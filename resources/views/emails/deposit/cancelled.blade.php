@extends('emails.layouts.app')

@section('content')
    <tr>
        <td style="padding-bottom: 10px; font-size: 14px; font-family: 'Inter', sans-serif; color: #a4a3ad;">
            <span class="im">
                <h3 class="m_-3852285001892450277transactions-paragraph">
                    {{ strtoupper($data['symbol']) }} Deposit Request Cancelled.
                </h3>
            </span>
            <p style="margin-top: 10px; margin-bottom: 20px; width: 100%; font-size: 15px; color: rgb(22, 22, 26); font-family: 'Inter', sans-serif;">
                Your deposit request of ${{ number_format($data['amount'], 2) }} has been <strong style="color: rgb(173, 20, 20)">cancelled</strong>, you can still create a new deposit request.
            </p>

            <p style="margin-top: 5px; margin-bottom: 20px; width: 100%; font-size: 13px; color: rgb(18, 18, 19); font-family: 'Inter', sans-serif;">
                Reason: <strong>No Payment</strong>
            </p>

            <span style="font-size:35px; font-weight: bold; line-height: 12px; color: rgb(192, 21, 21);letter-spacing:3px;">${{ number_format($data['amount'], 2) }}</span>
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
                                    Wallet
                                </div>
                            </div>
                            <div style="max-width: 50%; vertical-align: top; padding-bottom: 20px; margin-left: auto; font-size: 12px;">
                                <div class="m_-3852285001892450277payment-value">
                                   {{ ucfirst($data['wallet']) }}

                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr style="width: 100%;">
                        <td style="display: flex; justify-content:space-evenly; width:100%;">
                            <div style="display: inline-block; width: 100%; max-width: 50%; vertical-align: top; text-align: left; color: #a4a3ad;">
                                <div class="m_-3852285001892450277data-des">
                                    Reference
                                </div>
                            </div>
                            <div style="max-width: 50%; vertical-align: top; padding-bottom: 20px; margin-left: auto; font-size: 12px;">
                                <div class="m_-3852285001892450277payment-value">
                                   {{ $data['reference'] }}

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