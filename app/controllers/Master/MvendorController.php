<?php

namespace App\Controllers\Master;

class MvendorController extends \BaseController {

    function getIndex() {
        $data = \DB::table('tsvendor')->orderBy('fctanggal', 'desc')->paginate(\Helpers::constval('show_number_datatable'));
        //array column filter
        $colarr = array(
            'fcvendorid' => 'Vendor ID',
            'fcname' => 'Nama',
            'fcdesc' => 'Deskripsi',
            'fccontperson' => 'Contact Person',
            'fcaddress' => 'Alamat',
            'fcuserid' => 'User Pembuat',
            'fctanggal' => 'Tanggal Pembuatan',
            'fcphone' => 'Phone',
            'fcfax' => 'FAX',
            'fcemail' => 'Email',
        );
        return \View::make('Master/M_vendor/index', [
                    'data' => $data,
                    'colarr' => $colarr
        ]);
    }

    function getNew() {
        return \View::make('Master/M_vendor/new');
    }

    function postNew() {
        \DB::table('tsvendor')->insert(array(
            'fcname' => \Input::get('fcname'),
            'fcdesc' => \Input::get('fcdesc'),
            'fccontperson' => \Input::get('fccontperson'),
            'fcphone' => \Input::get('fcphone'),
            'fcfax' => \Input::get('fcfax'),
            'fcemail' => \Input::get('fcemail'),
            'fcvendorid' => \Input::get('fcvendorid'),
            'fcaddress' => \Input::get('fcaddress'),
            'fcuserid' => \Session::get('onusername')
        ));

        return \Redirect::to('master/vendor');
    }

    function getEdit($id) {
        $data = \DB::table('tsvendor')->where('rowguid', $id)->first();
        return \View::make('Master/M_vendor/edit', array(
                    'data' => $data
        ));
    }

    function postEdit() {

        \DB::table('tsvendor')
                ->where('rowguid', \Input::get('rowguid'))
                ->update(array(
                    'fcname' => \Input::get('fcname'),
                    'fcdesc' => \Input::get('fcdesc'),
                    'fccontperson' => \Input::get('fccontperson'),
                    'fcphone' => \Input::get('fcphone'),
                    'fcfax' => \Input::get('fcfax'),
                    'fcemail' => \Input::get('fcemail'),
                    'fcvendorid' => \Input::get('fcvendorid'),
                    'fcaddress' => \Input::get('fcaddress'),
                    'fcuserid' => \Session::get('onusername')
        ));

        return \Redirect::back();
    }

    function getDelete($id) {
        \DB::table('tsvendor')->where('rowguid', $id)->delete();
        return \Redirect::back();
    }

    function postFilter() {
        $data = \DB::table('tsvendor')->where(\Input::get('column'), 'like', '%' . \Input::get('value') . '%')->paginate(\Helpers::constval('show_number_datatable'));
        //array column filter
        $colarr = array(
            'fcvendorid' => 'Vendor ID',
            'fcname' => 'Nama',
            'fcdesc' => 'Deskripsi',
            'fccontperson' => 'Contact Person',
            'fcaddress' => 'Alamat',
            'fcuserid' => 'User Pembuat',
            'fctanggal' => 'Tanggal Pembuatan',
            'fcphone' => 'Phone',
            'fcfax' => 'FAX',
            'fcemail' => 'Email',
        );
        return \View::make('Master/M_vendor/index', [
                    'data' => $data,
                    'isfilter' => true,
                    'filter_col' => \Input::get('column'),
                    'filter_val' => \Input::get('value'),
                    'colarr' => $colarr
        ]);
    }

}
