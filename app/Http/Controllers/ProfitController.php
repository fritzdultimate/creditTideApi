<?php

namespace App\Http\Controllers;

use App\Enums\TransactionStatus;
use App\Mail\CustomMail;
use App\Models\Balance;
use App\Models\Interest;
use App\Models\Investment;
use App\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class ProfitController extends Controller
{
    private $currentDate;

    /**
     * Handle the incoming request.
     */
    public function __invoke() {
        // $this->currentDate = Carbon::parse('2023-12-06 10:43:04');
        $this->index();
    }

    private function isUpto24Hours($investment, $currentDate){
        $date = Carbon::create($investment->updated_at);
        $dateDifference = $date->diffInHours($currentDate);

        return $dateDifference >= 24;
    }
    private function isUptoAnHour($deposit, $currentDate){
        $date = Carbon::create($deposit->last_interest_date);
        $dateDifference = $date->diffInHours($currentDate);

        return $dateDifference >= 1;
    }

    private function isUptoAWeek($deposit, $currentDate){
        $date = Carbon::create($deposit->last_interest_date);
        $dateDifference = $date->diffInWeeks($currentDate);

        return $dateDifference >= 1;
    }

    
    private function isUptoAMonth($deposit, $currentDate) {
        $date = Carbon::create($deposit->last_interest_date);
        $dateDifference = $date->diffInMonths($currentDate);

        return $dateDifference >= 1;
    }

    private function isUptoCustom($deposit, $currentDate){
        
        // custom_profit_frquency possible values ['day', 'days', 'month', 'months'] etc
        // check Enum Class "InvestmentPlanTimeFrame"

        // sample output = addDays

        $timeFrameMethod = 'add' . ucfirst($deposit->plan->custom_profit_frequency);

        // get the last interest received date and add the custom profit frequency count

        $dueDate = Carbon::parse($deposit->last_Interest_date)
                    ->$timeFrameMethod($deposit->plan->profit_frequency_count);

        /*  e.g
        *   using addDays(1);
        *   addDays is the time_frame_method and the value "1" is the profit_frequency_count
        *   so we are adding a day to the last interest received date
        */            

        return $currentDate->gte($dueDate);
    }

    public function index(){

        $investments = Investment::with(['user' => fn ($query) => $query->where('is_suspended', false), 'plan', 'stock'])
            ->where([
                ['is_active', '=', 1],
                ['status', '=', 'active']
            ])
            ->get();

        foreach($investments as $investment){

            $this->currentDate = $currentDate = $this->currentDate ? $this->currentDate :  now();

            $frequencyType = match($investment->plan->interval) {
                'hourly' => 'isUptoAnHour',
                'daily' => 'isUpto24Hours',
                'weekly' => 'isUptoAWeek',
                'monthly' => 'isUptoAMonth',
                'custom' => 'isUptoCustom'
            };
    
            $isDueForInterest = $this->$frequencyType($investment, $currentDate);

            if($isDueForInterest) {

                try {
                    // DB::beginTransaction();

                    $interestToBeReceived = $investment->plan->interest_rate * ($investment->current_value * 0.01);
                    $accountBalanceBefore = $investment->current_value;
                    $investment->increment('current_value', $interestToBeReceived);
                    Balance::where('user_id', $investment->user->id)->increment('locked_balance', $interestToBeReceived);
                    $investment->save();
                    $accountBalanceAfter = $investment->current_value;

                    $txnId = generate_random_string(new Interest(), 'transaction_id', 'INV-');
                    $interest = Interest::create([
                        'user_id' => $investment->user->id,
                        'investment_id' => $investment->id,
                        'amount_deposited' => $investment->amount,
                        'interest' => $interestToBeReceived,
                        'balance_before' => $accountBalanceBefore > 0 ? $accountBalanceBefore : 0,
                        'balance_after' => $accountBalanceAfter > 0 ? $accountBalanceAfter : 0,
                        'transaction_id' => $txnId
                    ]);

                    if($interest) {
                        Transaction::create([
                            'user_id' => $investment->user->id,
                            'type' => 'profit',
                            'status' => TransactionStatus::COMPLETED,
                            'amount' => $interestToBeReceived,
                            'reference' => $txnId
                        ]);
                    }

                    // send email for profit
                    $app_name = env('APP_NAME');
                    $data = [
                        'view' => 'emails.investment.profit',
                        'subject' => "[$app_name] Investment Returns",
                        'email' => $investment->user->email,
                        'invested_amount' => $investment->amount,
                        'profit' => $interestToBeReceived,
                        'username' => $investment->user->username,
                        'plan' => $investment->plan->name,
                        'stock' => $investment->stock->name,
                        'reference' => $interest->transaction_id,
                        'date' => $investment->updated_at,
                    ];
                    Mail::to($data['email'])->queue(new CustomMail($data));

                    $interests = Interest::where([
                        'investment_id' => $investment->id,
                        'user_id' => $investment->user->id
                    ]);

                    if($interests->count() >= $investment->plan->duration) {
                        Investment::where('id', $investment->id)->update([
                            'status' => 'completed',
                            'is_active' => false
                        ]);
                        
                        Balance::where('user_id', $investment->user->id)->decrement('locked_balance', $investment->current_value);
                        Balance::where('user_id', $investment->user->id)->increment('balance', $investment->current_value);


                        // send email for completed investment
                    $app_name = env('APP_NAME');
                    $data = [
                        'view' => 'emails.investment.completed',
                        'subject' => "[$app_name] Investment Ended",
                        'email' => $investment->user->email,
                        'invested_amount' => $investment->amount,
                        'username' => $investment->user->username,
                        'plan' => $investment->plan->name,
                        'stock' => $investment->stock->name,
                        'interest_count' => $interests->count(),
                        'interest_sum' => $interests->sum('interest'),
                        'date' => $investment->updated_at,
                        'reference' => $investment->reference
                    ];
                    Mail::to($data['email'])->queue(new CustomMail($data));
                    }

                    // DB::commit();
                    
                } catch(\Exception $e){

                    // DB::rollBack();
                    Log::info($e->getMessage());
                    echo $e->getMessage();
                }
            }
        
        }
    }
    private function hasHourlyProfitFrequency($deposit){
        return $deposit->plan->profit_frequency === 'hourly';
    }
    private function durationLeft($date, $currentDate){
        $date = Carbon::create($date);
        $dateDifference = $date->diff($currentDate);
        return $dateDifference;
    }

    private function getNextInterestDate($deposit){
        $lastInterestDate = $deposit->last_interest_date->copy();

        return match($deposit->plan->profit_frequency) {
            'hourly' => $lastInterestDate->addHour(),
            'daily' => $lastInterestDate->addDay(),
            'weekly' => $lastInterestDate->addWeek(),
            'monthly' => $lastInterestDate->addMonth(),
            'custom' => function () use ($deposit, $lastInterestDate) {
                $timeFrameMethod = 'add' . ucfirst($deposit->plan->custom_profit_frequency);
                return $lastInterestDate->$timeFrameMethod($deposit->plan->profit_frequency_count);
            }
        };
    }
}
