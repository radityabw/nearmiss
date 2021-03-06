<?php

namespace App\Controllers\Master;

class MpegawaiController extends \BaseController {

    function getIndex() {
        $data = \DB::table('tsemployee')->orderBy('upddate', 'desc')->paginate(\Helpers::constval('show_number_datatable'));
        //array column filter
        $colarr = array(
            'fcemployeecode' => 'NIK',
            'fcemployeename' => 'Nama',
            'fcdescription' => 'Deskripsi',
            'fcsex' => 'Jenis Kelamin',
            'fclahir' => 'Tanggal Lahir',
            'fcstatus' => 'Status',
            'fcalamat' => 'Alamat',
            'fckota' => 'Kota',
            'fctelp' => 'Telp',
            'fdtglmasuk' => 'Tanggal Masuk',
            'fcpositioncode' => 'Posisi',
            'fcemplevel' => 'Level Pegawai',
            'fcgroupempl' => 'Grup Pegawai',
            'fcdeptcode' => 'Kode Departemen',
            'fcdivisioncode' => 'Kode Divisi',
            'userid' => 'User Pembuat',
            'upddate' => 'Tanggal Pembuatan',
            'fclabelname' => 'Label Nama',
            'fclabeldept' => 'Label Departemen',
            'email' => 'Email',
            'fcresign' => 'Resign',
            'status_safety' => 'Status Safety',
            'status_nearmiss' => 'Status Near Miss',
            'status_sms' => 'Status SMS',
        );
        return \View::make('Master/M_pegawai/index', [
                    'data' => $data,
                    'colarr' => $colarr
        ]);
    }

    function getNew() {
        return \View::make('Master/M_pegawai/new');
    }

    function postNew() {
        \DB::table('tsemployee')->insert(array(
            'fcname' => \Input::get('fcname'),
            'fcdesc' => \Input::get('fcdesc'),
            'fccontperson' => \Input::get('fccontperson'),
            'fcphone' => \Input::get('fcphone'),
            'fcfax' => \Input::get('fcfax'),
            'fcemail' => \Input::get('fcemail'),
            'fcpegawaiid' => \Input::get('fcpegawaiid'),
            'fcaddress' => \Input::get('fcaddress'),
            'fcuserid' => \Session::get('onusername')
        ));

        return \Redirect::to('master/pegawai');
    }

    function getEdit($id) {
        $data = \DB::table('tsemployee')->where('rowguid', $id)->first();
        return \View::make('Master/M_pegawai/edit', array(
                    'data' => $data
        ));
    }

    function postEdit() {

        \DB::table('tsemployee')
                ->where('rowguid', \Input::get('rowguid'))
                ->update(array(
                    'fcname' => \Input::get('fcname'),
                    'fcdesc' => \Input::get('fcdesc'),
                    'fccontperson' => \Input::get('fccontperson'),
                    'fcphone' => \Input::get('fcphone'),
                    'fcfax' => \Input::get('fcfax'),
                    'fcemail' => \Input::get('fcemail'),
                    'fcpegawaiid' => \Input::get('fcpegawaiid'),
                    'fcaddress' => \Input::get('fcaddress'),
                    'fcuserid' => \Session::get('onusername')
        ));

        return \Redirect::back();
    }

    function getDelete($id) {
        \DB::table('tsemployee')->where('rowguid', $id)->delete();
        return \Redirect::back();
    }

    function postFilter() {
        $data = \DB::table('tsemployee')->where(\Input::get('column'), 'like', '%' . \Input::get('value') . '%')->paginate(\Helpers::constval('show_number_datatable'));
        //array column filter
        $colarr = array(
            'fcpegawaiid' => 'Vendor ID',
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
        return \View::make('Master/M_pegawai/index', [
                    'data' => $data,
                    'isfilter' => true,
                    'filter_col' => \Input::get('column'),
                    'filter_val' => \Input::get('value'),
                    'colarr' => $colarr
        ]);
    }

}
