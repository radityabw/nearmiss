@extends('Parent.master')

@section('styles')
@stop

@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Master Group
            <small>New</small>
          </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="box box-primary">
                <div class="box-header">
                    <div class="pull-right" >
                        <a href="master/group" class="btn btn-danger">Cancel</a>
                    </div>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form role="form" action="master/group/edit" method="POST" >
                    <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                    <input type="hidden" name="rowguid" value="{{ $data->rowguid }}" />
                  <div class="box-body">
                      <div class="form-group">
                          <label >Group Code</label>
                          <input autofocus type="text" name="fcgroupcode" class="form-control" placeholder="Group Code" required maxlength="10" value="{{$data->fcgroupcode}}">
                      </div>
                  </div><!-- /.box-body -->
                  <div class="box-body">
                      <div class="form-group">
                          <label >Group Name</label>
                          <input autofocus type="text" name="fcgroupname" class="form-control" placeholder="Group Name" required maxlength="30" value="{{$data->fcgroupname}}" >
                      </div>
                  </div><!-- /.box-body -->
                  <div class="box-body">
                      <div class="form-group">
                          <label >Deskripsi</label>
                          <input autofocus type="text" name="fcdescription" class="form-control" placeholder="Deskripsi" maxlength="80" value="{{$data->fcdescription}}" >
                      </div>
                  </div><!-- /.box-body -->
                  <div class="box-body">
                      <div class="form-group">
                          <label >WS</label>
                          <input autofocus type="text" name="ws" class="form-control" placeholder="WS" maxlength="1" value="{{$data->ws}}">
                      </div>
                  </div><!-- /.box-body -->

                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <a class="btn btn-danger" href="master/group" >Cancel</a>
                  </div>
                </form>
              </div><!-- /.box -->

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
@stop

@section('scripts')
@stop