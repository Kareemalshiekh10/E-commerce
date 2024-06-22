@extends('admin.layouts.app') 
@section('style')
@endsection
@section('content')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
              <!-- Info boxes -->
              <div class="row">

      
                <div class="col-12 col-sm-6 col-md-2">
                  <div class="info-box mb-3">
                    <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text">Total Orders</span>
                      <span class="info-box-number">{{ $TotalOrder }}</span>
                    </div>
                    <!-- /.info-box-content -->
                  </div>
                  <!-- /.info-box -->
                </div>

                
                <div class="col-12 col-sm-6 col-md-2">
                  <div class="info-box mb-3">
                    <span class="info-box-icon bg-info elevation-1"><i class="fas fa-clipboard-list"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text">Today Orders</span>
                      <span class="info-box-number">{{ $TotalTodayOrder }}</span>
                    </div>
                    <!-- /.info-box-content -->
                  </div>
                  <!-- /.info-box -->
                </div>

                <div class="col-12 col-sm-6 col-md-2">
                  <div class="info-box mb-3">
                    <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-dollar-sign"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text">Total Amount</span>
                      <span class="info-box-number">${{ number_format($TotalAmount,2) }}</span>
                    </div>
                    <!-- /.info-box-content -->
                  </div>
                  <!-- /.info-box -->
                </div>

                <div class="col-12 col-sm-6 col-md-2">
                  <div class="info-box mb-3">
                    <span class="info-box-icon bg-primary elevation-1"><i class="fas fa-money-bill-wave"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text">Today Amount</span>
                      <span class="info-box-number">${{ number_format($TotalTodayAmount,2) }}</span>
                    </div>
                    <!-- /.info-box-content -->
                  </div>
                  <!-- /.info-box -->
                </div>

                <div class="col-12 col-sm-6 col-md-2">
                  <div class="info-box mb-3">
                    <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-user-friends"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text">Total Customers</span>
                      <span class="info-box-number">{{ $TotalCustomer }}</span>
                    </div>
                    <!-- /.info-box-content -->
                  </div>
                  <!-- /.info-box -->
                </div>
                <div class="col-12 col-sm-6 col-md-2">
                  <div class="info-box mb-3">
                    <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-user-friends"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text">Total Today Customers</span>
                      <span class="info-box-number">{{ $TotalTodayCustomer }}</span>
                    </div>
                    <!-- /.info-box-content -->
                  </div>
                  <!-- /.info-box -->
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
        <div class="row">
          <div class="col-lg-12">
         

            <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">Latest Orders</h3>
                <div class="card-tools">
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-download"></i>
                  </a>
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-bars"></i>
                  </a>
                </div>
              </div>
              <div class="card-body table-responsive p-0">

                <table class="table table-striped table-valign-middle">
                  <thead>
                      <tr>
                          <th>#</th>
                          <th>Name</th>
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
                          <th>Created Date</th>
                          <th>Action</th>
                      </tr>
                  </thead>
                  <tbody>
                      @foreach ($getLatestOrders as $value)
                          <tr>
                              <td>{{ $value->id }}</td>
                              <td>{{ $value->first_name }} {{ $value->last_name }}</td>
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
              </div>
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col-md-6 -->
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                  <h3 class="card-title">Sales</h3>
                  <a href="javascript:void(0);">View Report</a>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex">
                  <p class="d-flex flex-column">
                    <span class="text-bold text-lg">$18,230.00</span>
                    <span>Sales Over Time</span>
                  </p>
                  <p class="ml-auto d-flex flex-column text-right">
                    <span class="text-success">
                      <i class="fas fa-arrow-up"></i> 33.1%
                    </span>
                    <span class="text-muted">Since last month</span>
                  </p>
                </div>
                <!-- /.d-flex -->

                <div class="position-relative mb-4">
                  <canvas id="sales-chart" height="200"></canvas>
                </div>

                <div class="d-flex flex-row justify-content-end">
                  <span class="mr-2">
                    <i class="fas fa-square text-primary"></i> This year
                  </span>

                  <span>
                    <i class="fas fa-square text-gray"></i> Last year
                  </span>
                </div>
              </div>
            </div>
            <!-- /.card -->

            <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">Online Store Overview</h3>
                <div class="card-tools">
                  <a href="#" class="btn btn-sm btn-tool">
                    <i class="fas fa-download"></i>
                  </a>
                  <a href="#" class="btn btn-sm btn-tool">
                    <i class="fas fa-bars"></i>
                  </a>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-success text-xl">
                    <i class="ion ion-ios-refresh-empty"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                      <i class="ion ion-android-arrow-up text-success"></i> 12%
                    </span>
                    <span class="text-muted">CONVERSION RATE</span>
                  </p>
                </div>
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-warning text-xl">
                    <i class="ion ion-ios-cart-outline"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                      <i class="ion ion-android-arrow-up text-warning"></i> 0.8%
                    </span>
                    <span class="text-muted">SALES RATE</span>
                  </p>
                </div>
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center mb-0">
                  <p class="text-danger text-xl">
                    <i class="ion ion-ios-people-outline"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                      <i class="ion ion-android-arrow-down text-danger"></i> 1%
                    </span>
                    <span class="text-muted">REGISTRATION RATE</span>
                  </p>
                </div>
                <!-- /.d-flex -->
              </div>
            </div>
          </div>
          <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection

@section('script')
<script src="{{ url('public/assets/dist/js/pages/dashboard3.js') }}"></script>
@endsection