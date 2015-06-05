<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;

class MsafetycederaController extends Controller {

    function getIndex() {
        $data = \DB::table('safety_cedera')->get();
        return \View::make('Master/M_safety_cedera/index', [
            'data' => $data
        ]);
    }

    function getNew() {
        return \View::make('Master/M_safety_cedera/new');
    }

    function postNew() {
        \DB::table('safety_cedera')->insert(array(
        'code' => 4,
        'description' => \Input::get('desc')
        ));
        
        return \Redirect::to('master/safetycedera');
    }

}
