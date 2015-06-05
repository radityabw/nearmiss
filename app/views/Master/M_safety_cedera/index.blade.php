@extends('Parent.master')

@section('styles')
<link href="plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
@stop

@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Master Safety Cedera
        </h1>
        <!--          <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
                    <li class="active">Here</li>
                  </ol>-->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="box">
            <div class="box-header">
                <!--<h3 class="box-title">Data Table With Full Features</h3>-->
                <div class="pull-right" >
                    <a class="btn btn-primary bn-sm" href="master/safetycedera/new" >New</a>
                </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <table class="table table-bordered table-condensed table-striped datatable">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Code</th>
                            <th>Desc</th>
                            <th>Userupd</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($data as $dt)
                        <tr>
                            <td></td>
                            <td>{{$dt->Code}}</td>
                            <td>{{$dt->Description}}</td>
                            <td>{{$dt->Userupd}}</td>
                            <td></td>
                        </tr>
                        @endforeach
                        
                </table>
            </div><!-- /.box-body -->
        </div><!-- /.box -->

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
@stop

@section('scripts')
<!-- DATA TABES SCRIPT -->
<script src="plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>
<!-- page script -->
    <script type="text/javascript">
      $(function () {
          
        $('.datatable').dataTable();
      });
    </script>
@stop