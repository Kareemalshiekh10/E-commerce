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
                        <h1>Orders List  (Total: {{ $getRecord->total() }})</h1>
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
                                    <h3 class="card-title">Orders Search</h3>
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
                                              <label>Company Name</label>
                                              <input type="text" class="form-control" name="company_name" value="{{ Request::get('company_name') }}" placeholder="Company Name">
                                          </div>
                                      </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>First Name</label>
                                                <input type="text" class="form-control" name="first_name" value="{{ Request::get('first_name') }}" placeholder="First Name">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Last Name</label>
                                                <input type="text" class="form-control" name="last_name" value="{{ Request::get('last_name') }}" placeholder="Last Name">
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
                                                <label>Country</label>
                                                <input type="text" class="form-control" name="country" value="{{ Request::get('country') }}" placeholder="Country">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>State</label>
                                                <input type="text" class="form-control" name="state" value="{{ Request::get('state') }}" placeholder="State">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>City</label>
                                                <input type="text" class="form-control" name="city" value="{{ Request::get('city') }}" placeholder="City">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                          <div class="form-group">
                                              <label>Phone</label>
                                              <input type="text" class="form-control" name="phone" value="{{ Request::get('phone') }}" placeholder="Phone">
                                          </div>
                                      </div>
                                      <div class="col-md-2">
                                        <div class="form-group">
                                            <label>Postcode</label>
                                            <input type="text" class="form-control" name="postcode" value="{{ Request::get('postcode') }}" placeholder="postcode">
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
                                        <a href="{{ url('admin/orders/list') }}" class="btn btn-primary">Reset</a>
                                      </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </form>

                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Orders List</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0" style="overflow:auto;">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th>Company Name</th>
                                            <th>Country</th>
                                            <th>Address</th>
                                            <th>City</th>
                                            <th>State</th>
                                            <th>Postcode</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                            <th>Discount Code</th>
                                            <th>Discount Amount ($)</th>
                                            <th>Shipping Amount ($)</th>
                                            <th>Total Amount ($)</th>
                                            <th>Payment Method</th>
                                           {{--  <th>Status</th> --}}
                                            <th>Created Date</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($getRecord as $value)
                                            <tr>
                                                <td>{{ $value->id }}</td>
                                                <td>{{ $value->first_name }} {{ $value->last_name }}</td>
                                                <td>{{ $value->company_name }}</td>
                                                <td>{{ $value->country }}</td>
                                                <td>{{ $value->address_one }}<br />{{ $value->address_two }}</td>
                                                <td>{{ $value->city }}</td>
                                                <td>{{ $value->state }}</td>
                                                <td>{{ $value->postcode }}</td>
                                                <td>{{ $value->phone }}</td>
                                                <td>{{ $value->email }}</td>
                                                <td>{{ $value->discount_code }}</td>
                                                <td>{{ number_format($value->discount_amount, 2) }}</td>
                                                <td>{{ number_format($value->shipping_amount, 2) }}</td>
                                                <td>{{ number_format($value->total_amount, 2) }}</td>
                                                <td style="text-transform: capitalize;">{{ $value->payment_method }}</td>
                                           {{--      <td><!-- Add status value here --></td> --}}
                                                <td>{{ date('d-M-Y H:i A', strtotime($value->created_at)) }}</td>
                                                <td>
                                                    <a href="{{ url('admin/orders/detail/' . $value->id) }}"
                                                        class="btn btn-info btn-sm">Details</a>
                                                   {{--  <a href="{{ url('admin/orders/edit/' . $value->id) }}"
                                                        class="btn btn-primary btn-sm">Edit</a>
                                                    <a href="{{ url('admin/orders/delete/' . $value->id) }}"
                                                        class="btn btn-danger btn-sm"
                                                        onclick="return confirm('Are you sure you want to delete this record?');">Delete</a> --}}
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
