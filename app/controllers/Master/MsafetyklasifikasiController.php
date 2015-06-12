<?php

namespace App\Controllers\Master;

class MsafetyklasifikasiController extends \BaseController {

    function getIndex() {
        $data = \DB::table('safety_klasifikasi')->orderBy('tglupd', 'desc')->paginate(\Helpers::constval('show_number_datatable'));
        return \View::make('Master/M_safety_klasifikasi/index', [
                    'data' => $data
        ]);
    }

    function getNew() {
        return \View::make('Master/M_safety_klasifikasi/new');
    }

    function postNew() {
        \DB::select("CALL SP_INSERT_SAFETY_KLASIFIKASI('" . \Input::get('desc') . "', '" . \Session::get('onusername') . "')");

        return \Redirect::to('master/safetyklasifikasi');
    }

    function getEdit($id) {
        $data = \DB::table('safety_klasifikasi')->where('code', $id)->first();
        return \View::make('Master/M_safety_klasifikasi/edit', array(
                    'data' => $data
        ));
    }

    function postEdit() {
        \DB::table('safety_klasifikasi')
                ->where('code', \Input::get('code'))
                ->update(array(
                    'description' => \Input::get('desc')
        ));

        return \Redirect::back();
    }

    function getDelete($id) {
        \DB::table('safety_klasifikasi')->where('code', $id)->delete();
        return \Redirect::back();
    }

    function postFilter() {
        $data = \DB::table('safety_klasifikasi')->where(\Input::get('column'), 'like', '%' . \Input::get('value') . '%')->paginate(\Helpers::constval('show_number_datatable'));
        return \View::make('Master/M_safety_klasifikasi/index', [
                    'data' => $data,
                    'isfilter' => true,
                    'filter_col' => \Input::get('column'),
                    'filter_val' => \Input::get('value')
        ]);
    }

}
