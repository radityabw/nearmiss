<?php

namespace App\Controllers\Master;

class MsafetyjenispekerjaanController extends \BaseController {

    function getIndex() {
        $data = \DB::table('safety_jp')->orderBy('tglupd', 'desc')->paginate(\Helpers::constval('show_number_datatable'));
        return \View::make('Master/M_safety_jenispekerjaan/index', [
                    'data' => $data
        ]);
    }

    function getNew() {
        return \View::make('Master/M_safety_jenispekerjaan/new');
    }

    function postNew() {
        \DB::select("CALL SP_INSERT_JENISPEKERJAAN('" . \Input::get('desc') . "', '" . \Session::get('onusername') . "')");

        return \Redirect::to('master/jenispekerjaan');
    }

    function getEdit($id) {
        $data = \DB::table('safety_jp')->where('code', $id)->first();
        return \View::make('Master/M_safety_jenispekerjaan/edit', array(
                    'data' => $data
        ));
    }

    function postEdit() {
        \DB::table('safety_jp')
                ->where('code', \Input::get('code'))
                ->update(array(
                    'description' => \Input::get('desc')
        ));

        return \Redirect::back();
    }

    function getDelete($id) {
        \DB::table('safety_jp')->where('code', $id)->delete();
        return \Redirect::back();
    }

    function postFilter() {
        $data = \DB::table('safety_jp')->where(\Input::get('column'), 'like', '%' . \Input::get('value') . '%')->paginate(\Helpers::constval('show_number_datatable'));
        return \View::make('Master/M_safety_jenispekerjaan/index', [
                    'data' => $data,
                    'isfilter' => true,
                    'filter_col' => \Input::get('column'),
                    'filter_val' => \Input::get('value')
        ]);
    }

}
