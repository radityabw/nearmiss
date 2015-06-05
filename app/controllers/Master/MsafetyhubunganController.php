<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;

class MsafetyhubunganController extends Controller {

    function getIndex() {
        $data = \DB::table('safety_hubungan')->get();
        return \View::make('Master/M_safety_hubungan/index', [
            'data' => $data
        ]);
    }

    function getNew() {
        return \View::make('Master/M_safety_hubungan/new');
    }

//
//    function postNew() {
//        \DB::table('safety_cedera')->insert(array(
//        'code' => 4,
//        'description' => \Input::get('desc')
//        ));
//        
//        return \Redirect::to('master/safetycedera');
//    }

    function getEdit($id) {
        $safetyhubungan = \DB::table('safety_hubungan')->where('Code', $id)->first();

        return \View::make('Master/M_safety_hubungan/edit', array(
            'safetyhubungan' => $safetyhubungan
        ));
    }

    function postEdit() {

        \DB::table('safety_hubungan')->where('Code', \Input::get('safetyhubungan_code'))
                ->update(array(
                    'Description' => \Input::get('desc')
        ));

        return \Redirect::to('master/safetyhubungan');
    }

}
