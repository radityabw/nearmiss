<?php

namespace App\Controllers\Master;

class MsafetycederaController extends \BaseController {

    function getIndex() {
        $data = \DB::table('safety_cedera')->orderBy('tglupd', 'desc')->paginate(\Helpers::constval('show_number_datatable'));
        return \View::make('Master/M_safety_cedera/index', [
                    'data' => $data
        ]);
    }

    function getNew() {
        return \View::make('Master/M_safety_cedera/new');
    }

    function postNew() {
        \DB::select("CALL SP_INSERT_SAFETY_CEDERA('" . \Input::get('desc') . "', '" . \Session::get('onusername') . "')");

        return \Redirect::to('master/safetycedera');
    }

    function getEdit($id) {
        $data = \DB::table('safety_cedera')->where('code', $id)->first();
        return \View::make('Master/M_safety_cedera/edit', array(
                    'data' => $data
        ));
    }

    function postEdit() {
        \DB::table('safety_cedera')
                ->where('code', \Input::get('code'))
                ->update(array(
                    'description' => \Input::get('desc')
        ));

        return \Redirect::back();
    }

    function getDelete($id) {
        \DB::table('safety_cedera')->where('code', $id)->delete();
        return \Redirect::back();
    }

    function postFilter() {
        $data = \DB::table('safety_cedera')->where(\Input::get('column'), 'like', '%' . \Input::get('value') . '%')->paginate(\Helpers::constval('show_number_datatable'));
        return \View::make('Master/M_safety_cedera/index', [
                    'data' => $data,
                    'isfilter' => true,
                    'filter_col' => \Input::get('column'),
                    'filter_val' => \Input::get('value')
        ]);
    }

}
