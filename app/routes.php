<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', function()
{
//	return View::make('hello');
    return Redirect::to('login');
});

Route::controller('home', 'App\Controllers\HomeController');
Route::controller('login', 'App\Controllers\LoginController');

Route::group(array('prefix' => 'master'), function() {
    Route::controller('safetyanggotabadan', 'App\Controllers\Master\MsafetyanggotabadanController');
});


