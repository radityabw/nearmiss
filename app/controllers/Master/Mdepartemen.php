<?php

namespace App\Controllers\Master;

class MdepartemenController extends \BaseController {

    function getIndex() {
        $data = \DB::table('tsdepartment')->orderBy('fctglupd', 'desc')->paginate(\Helpers::constval('show_number_datatable'));
        //array column filter
        $colarr = array(
            'fcdeptid' => 'Departemen ID',
            'fcname' => 'Nama',
            'fcdesc' => 'Deskripsi',
            'fcpic' => 'PIC',
            'fcuserid' => 'User Pembuat',
            'fctglupd' => 'Tanggal Pembuatan',
        );
        return \View::make('Master/M_departemen/index', [
                    'data' => $data,
                    'colarr' => $colarr
        ]);
    }

    function getNew() {
        return \View::make('Master/M_departemen/new');
    }

    function postNew() {
        \DB::table('tsdepartment')
                ->insert(array(
                    'fcdeptid' => \Input::get('fcdeptid'),
                    'fcname' => \Input::get('fcname'),
                    'fcdesc' => \Input::get('fcdesc'),
                    'fcpic' => \Input::get('fcpic'),
                    'fcuserid' => \Session::get('onusername')
        ));

        return \Redirect::to('master/departemen');
    }

    function getEdit($id) {
        $data = \DB::table('tsdepartment')->where('rowguid', $id)->first();
        return \View::make('Master/M_departemen/edit', array(
                    'data' => $data
        ));
    }

    function postEdit() {

        \DB::table('tsdepartment')
                ->where('rowguid', \Input::get('rowguid'))
                ->update(array(
                    'fcdeptid' => \Input::get('fcdeptid'),
                    'fcname' => \Input::get('fcname'),
                    'fcdesc' => \Input::get('fcdesc'),
                    'fcpic' => \Input::get('fcpic'),
                    'fcuserid' => \Session::get('onusername')
        ));

        return \Redirect::back();
    }

    function getDelete($id) {
        \DB::table('tsdepartment')->where('rowguid', $id)->delete();
        return \Redirect::back();
    }

    function postFilter() {
        $data = \DB::table('tsdepartment')->where(\Input::get('column'), 'like', '%' . \Input::get('value') . '%')->paginate(\Helpers::constval('show_number_datatable'));
        //array column filter
         $colarr = array(
            'fcdeptid' => 'Departemen ID',
            'fcname' => 'Nama',
            'fcdesc' => 'Deskripsi',
            'fcpic' => 'PIC',
            'fcuserid' => 'User Pembuat',
            'fctglupd' => 'Tanggal Pembuatan',
        );
        return \View::make('Master/M_departemen/index', [
                    'data' => $data,
                    'isfilter' => true,
                    'filter_col' => \Input::get('column'),
                    'filter_val' => \Input::get('value'),
                    'colarr' => $colarr
        ]);
    }

}
