@extends('Parent.master')

@section('styles')
@stop

@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Master Departemen
            <small>New</small>
          </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="box box-primary">
                <div class="box-header">
                    <div class="pull-right" >
                        <a href="master/departemen" class="btn btn-danger">Cancel</a>
                    </div>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form role="form" action="master/departemen/edit" method="POST" >
                    <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                    <input type="hidden" name="rowguid" value="{{ $data->rowguid }}" />
                  <div class="box-body">
                      <div class="form-departemen">
                          <label >Departemen ID</label>
                          <input autofocus type="text" name="fcdeptid" class="form-control" placeholder="Departemen ID" required maxlength="3" value="{{$data->fcdeptid}}">
                      </div>
                  </div><!-- /.box-body -->
                  <div class="box-body">
                      <div class="form-departemen">
                          <label >Nama</label>
                          <input autofocus type="text" name="fcname" class="form-control" placeholder="Nama" required maxlength="30" value="{{$data->fcname}}" >
                      </div>
                  </div><!-- /.box-body -->
                  <div class="box-body">
                      <div class="form-departemen">
                          <label >Deskripsi</label>
                          <input autofocus type="text" name="fcdesc" class="form-control" placeholder="Deskripsi" maxlength="150" value="{{$data->fcdesc}}" >
                      </div>
                  </div><!-- /.box-body -->
                  <div class="box-body">
                      <div class="form-departemen">
                          <label >PIC</label>
                          <input autofocus type="text" name="fcpic" class="form-control" placeholder="PIC" maxlength="50" value="{{$data->fcpic}}" >
                      </div>
                  </div><!-- /.box-body -->

                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <a class="btn btn-danger" href="master/departemen" >Cancel</a>
                  </div>
                </form>
              </div><!-- /.box -->

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
@stop

@section('scripts')
@stop