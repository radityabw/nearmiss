<?php

namespace App\Controllers\Master;

class MsafetyanggotabadanController extends \BaseController {

    function getIndex() {
        $data = \DB::table('safety_anggotabadan')->orderBy('tglupd', 'desc')->paginate(\Helpers::constval('show_number_datatable'));
        return \View::make('Master/M_safety_anggotabadan/index', [
                    'data' => $data
        ]);
    }

    function getNew() {
        return \View::make('Master/M_safety_anggotabadan/new');
    }

    function postNew() {
        \DB::select("CALL SP_INSERT_SAFETY_ANGGOTABADAN('" . \Input::get('desc') . "', '" . \Session::get('onusername') . "')");

        return \Redirect::to('master/safetyanggotabadan');
    }

    function getEdit($id) {
        $data = \DB::table('safety_anggotabadan')->where('code', $id)->first();
        return \View::make('Master/M_safety_anggotabadan/edit', array(
                    'data' => $data
        ));
    }
    
    function postEdit(){
        \DB::table('safety_anggotabadan')
                ->where('code',\Input::get('code'))
                ->update(array(
                    'description'=>\Input::get('desc')
                ));
        
        return \Redirect::back();
    }

    function getDelete($id) {
        \DB::table('safety_anggotabadan')->where('code', $id)->delete();
        return \Redirect::back();
    }

}
