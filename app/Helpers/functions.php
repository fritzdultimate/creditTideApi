<?php

use App\Models\AdminSettings;
use Carbon\Carbon;

function generate_random_string($table, $column, $prefix = '', $more_entropy = false) {
    // $hash = bin2hex(random_bytes($length));
    $id = uniqid($prefix, $more_entropy);
    $check_id_exist = $table->where([$column => $id])->first();

    if($check_id_exist) {
        generate_random_string($table, $column, $prefix, $more_entropy);
    }

    return $id;
}

function adminSettings() {
    return AdminSettings::first();
}

function generate_random_string_static() {
    // $hash = bin2hex(random_bytes($length));
    $id = uniqid('FTRN-', false);

    return $id;
}

function get_ip_addr() {
    return "197.210.78.248"; //use getenv('REMOTE_ADDR') in production
}

function removeSpaces(string $str) : string {
    return str_replace(' ', '', $str);
}

function getDateString($timestring, $format) {
    $date = Carbon::parse($timestring);
    return $date->isoFormat($format);
}

function getTimeString($timestring, $format) {
    $date = Carbon::parse($timestring);
    return $date->isoFormat($format);
}

function getUserTimezone(){
    $ip = file_get_contents("http://ipecho.net/plain");
    $url = 'http://ip-api.com/json/'.$ip;
    $tz = file_get_contents($url);
    $tz = json_decode($tz,true)['timezone'];

    return $tz;
}

function getProfitEndDate($plan){
    
    $timeFrameMethod = 'add' . ucfirst($plan->time_frame);
    $endDate = now()->$timeFrameMethod($plan->duration);

    return $endDate;
}

function thounsandCurrencyFormat($num) {
    if($num > 1000) {
        $x = round($num);
        $x_number_format = number_format($x);
        $x_array = explode(',',  $x_number_format);
        $x_parts = array('k', 'm', 'b', 't');
        $x_count_parts = count($x_array) - 1;
        $x_display = $x;
        $x_display = $x_array[0] . ((int) $x_array[1][0] !== 0 ? '.' . $x_array[1][0] : '');
        $x_display .= $x_parts[$x_count_parts - 1];

        return $x_display;
    }

    return $num;
    
}