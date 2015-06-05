<?php

namespace App\Controllers;

class LoginController extends \BaseController {

    function getIndex() {
        return \View::make('login');
    }

    function postAuth() {
        $creds = array(
            'username' => \Input::get('username'),
            'password' => \Input::get('password')
        );

        try {
            \Illuminate\Support\Facades\Auth::attempt($creds);

            
            $user = \Toddish\Verify\Models\User::where('username', \Input::get('username'))->first();

            \Session::put('onuser_id', $user->id);
            \Session::put('onusername', $user->username);
            \Session::put('islogin', true);

            return \Redirect::to('home');
        } catch (\Exception $e) {

            if (\Request::ajax()) {
                return 'loginerror';
            } else {
                Return \Redirect::to('login')->withErrors('loginerror');  //->with('login_errors',true);
            }
            return Response::error('404');
        }
    }

}
