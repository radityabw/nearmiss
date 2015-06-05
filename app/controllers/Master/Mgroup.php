<?php

namespace App\Controllers\Master;

class MgroupController extends \BaseController {

    function getIndex() {
        $data = \DB::table('secgroup')->orderBy('upddate', 'desc')->paginate(\Helpers::constval('show_number_datatable'));
        //array column filter
        $colarr = array(
            'fcgroupcode' => 'Group Code', 
            'fcgroupname' => 'Group Name', 
            'fcdescription' => 'Deskripsi', 
            'userid' => 'User Pembuat',
            'upddate' => 'Tanggal Pembuatan',
            'ws' => 'WS',
            );
        return \View::make('Master/M_group/index', [
                    'data' => $data,
                    'colarr' => $colarr
        ]);
    }

    function getNew() {
        return \View::make('Master/M_group/new');
    }

    function postNew() {
        \DB::table('secgroup')->insert(array(
            'fcgroupcode' => \Input::get('fcgroupcode'),
            'fcgroupname' => \Input::get('fcgroupname'),
            'fcdescription' => \Input::get('fcdescription'),
            'userid' => \Session::get('onusername'),
            'ws' => \Input::get('ws')
        ));

        return \Redirect::to('master/group');
    }

    function getEdit($id) {
        $data = \DB::table('secgroup')->where('fcgroupcode', $id)->first();
        return \View::make('Master/M_group/edit', array(
                    'data' => $data
        ));
    }

    function postEdit() {

        \DB::table('secgroup')
                ->where('rowguid', \Input::get('rowguid'))
                ->update(array(
                    'fcgroupcode' => \Input::get('fcgroupcode'),
                    'fcgroupname' => \Input::get('fcgroupname'),
                    'fcdescription' => \Input::get('fcdescription'),
                    'ws' => \Input::get('ws')
        ));

        return \Redirect::back();
    }

    function getDelete($id) {
        \DB::table('secgroup')->where('fcgroupcode', $id)->delete();
        return \Redirect::back();
    }

    function postFilter() {
        $data = \DB::table('secgroup')->where(\Input::get('column'), 'like', '%' . \Input::get('value') . '%')->paginate(\Helpers::constval('show_number_datatable'));
        //array column filter
        $colarr = array(
            'fcgroupcode' => 'Group Code', 
            'fcgroupname' => 'Group Name', 
            'fcdescription' => 'Deskripsi', 
            'userid' => 'User Pembuat',
            'upddate' => 'Tanggal Pembuatan',
            'ws' => 'WS',
            );
        return \View::make('Master/M_group/index', [
                    'data' => $data,
                    'isfilter' => true,
                    'filter_col' => \Input::get('column'),
                    'filter_val' => \Input::get('value'),
                    'colarr' => $colarr,
        ]);
    }

}
