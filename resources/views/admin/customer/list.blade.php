@extends('admin.layouts.app') 
@section('style')
@endsection
@section('content')

<div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
              <div class="row mb-2">
                <div class="col-sm-6">
                  <h1>Customer List  (Total: {{ $getRecord->total() }})</h1>
                </div>
              </div>
            </div><!-- /.container-fluid -->
          </section>
      
          <!-- Main content -->
          <section class="content">
            <div class="container-fluid">
              <div class="row">

                <div class="col-md-12">
                    @include('admin.layouts._message')

                    <form method="GET">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Customer Search</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>ID</label>
                                            <input type="text" class="form-control" name="id" value="{{ Request::get('id') }}" placeholder="ID">
                                        </div>
                                    </div>
                                   
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input type="text" class="form-control" name="name" value="{{ Request::get('name') }}" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" class="form-control" name="email" value="{{ Request::get('email') }}" placeholder="Email">
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>From Date</label>
                                            <input type="date" style="padding: 6px;" class="form-control"
                                                name="from_date" value="{{ Request::get('from_date') }}">
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>To Date</label>
                                            <input type="date" style="padding: 6px;" class="form-control"
                                                name="to_date" value="{{ Request::get('to_date') }}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-12">
                                    <button class="btn btn-primary">Search</button>
                                    <a href="{{ url('admin/customer/list') }}" class="btn btn-primary">Reset</a>
                                  </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </form>

      
                  <div class="card">
                    <div class="card-header">
                      <h3 class="card-title">Customer List</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Created Date</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                            @foreach ($getRecord as $value)
                            <tr>
                            <td>{{ $value->id }}</td>
                            <td>{{ $value->name }}</td>
                            <td>{{ $value->email }}</td>
                            <td>{{ ($value->status == 0) ? 'Active': 'InActive'}}</td>
                            <td>{{ date('d-m-Y', strtotime($value->created_at)) }}</td>
                            <td>
                                <a href="{{ url('admin/admin/delete/'.$value->id) }}" class="btn btn-danger">Delete</a>
                            </td>
                            </tr>
                            @endforeach
                        </tbody>
                      </table>
                      <div style="padding:10px; float: right;">
                        {!! $getRecord->appends(Illuminate\Support\Facades\Request::except('page'))->links() !!}
                    </div>
                    </div>
                    <!-- /.card-body -->
                  </div>
                  <!-- /.card -->
                </div>
                <!-- /.col -->
              </div>
 
            </div>
          </section>
          <!-- /.content -->
</div>


@endsection

@section('script')
<script src="{{ url('public/assets/dist/js/pages/dashboard3.js') }}"></script>
@endsection