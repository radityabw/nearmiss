<?php

namespace App\Controllers\Master;

class MsafetyjenisbahayaController extends \BaseController {

    function getIndex() {
        $data = \DB::table('safety_jenisbahaya')->orderBy('tglupd', 'desc')->paginate(\Helpers::constval('show_number_datatable'));
        return \View::make('Master/M_safety_jenisbahaya/index', [
                    'data' => $data
        ]);
    }

    function getNew() {
        return \View::make('Master/M_safety_jenisbahaya/new');
    }

    function postNew() {
        \DB::select("CALL SP_INSERT_JENISBAHAYA('" . \Input::get('desc') . "', '" . \Session::get('onusername') . "')");

        return \Redirect::to('master/jenisbahaya');
    }

    function getEdit($id) {
        $data = \DB::table('safety_jenisbahaya')->where('code', $id)->first();
        return \View::make('Master/M_safety_jenisbahaya/edit', array(
                    'data' => $data
        ));
    }

    function postEdit() {
        \DB::table('safety_jenisbahaya')
                ->where('code', \Input::get('code'))
                ->update(array(
                    'description' => \Input::get('desc')
        ));

        return \Redirect::back();
    }

    function getDelete($id) {
        \DB::table('safety_jenisbahaya')->where('code', $id)->delete();
        return \Redirect::back();
    }

    function postFilter() {
        $data = \DB::table('safety_jenisbahaya')->where(\Input::get('column'), 'like', '%' . \Input::get('value') . '%')->paginate(\Helpers::constval('show_number_datatable'));
        return \View::make('Master/M_safety_jenisbahaya/index', [
                    'data' => $data,
                    'isfilter' => true,
                    'filter_col' => \Input::get('column'),
                    'filter_val' => \Input::get('value')
        ]);
    }

}
