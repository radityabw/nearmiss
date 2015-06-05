<?php

namespace App\Controllers\Master;

class MsafetykeadaanController extends \BaseController {

    function getIndex() {
        $data = \DB::table('safety_keadaan')->orderBy('tglupd', 'desc')->paginate(\Helpers::constval('show_number_datatable'));
        return \View::make('Master/M_safety_keadaan/index', [
                    'data' => $data
        ]);
    }

    function getNew() {
        return \View::make('Master/M_safety_keadaan/new');
    }

    function postNew() {
        \DB::select("CALL SP_INSERT_KEADAAN('" . \Input::get('desc') . "', '" . \Session::get('onusername') . "')");

        return \Redirect::to('master/safetykeadaan');
    }

    function getEdit($id) {
        $data = \DB::table('safety_keadaan')->where('code', $id)->first();
        return \View::make('Master/M_safety_keadaan/edit', array(
                    'data' => $data
        ));
    }

    function postEdit() {
        \DB::table('safety_keadaan')
                ->where('code', \Input::get('code'))
                ->update(array(
                    'description' => \Input::get('desc')
        ));

        return \Redirect::back();
    }

    function getDelete($id) {
        \DB::table('safety_keadaan')->where('code', $id)->delete();
        return \Redirect::back();
    }

    function postFilter() {
        $data = \DB::table('safety_keadaan')->where(\Input::get('column'), 'like', '%' . \Input::get('value') . '%')->paginate(\Helpers::constval('show_number_datatable'));
        return \View::make('Master/M_safety_keadaan/index', [
                    'data' => $data,
                    'isfilter' => true,
                    'filter_col' => \Input::get('column'),
                    'filter_val' => \Input::get('value')
        ]);
    }

}
