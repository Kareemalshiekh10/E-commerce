@extends('admin.layouts.app')
@section('style')
@endsection
@section('content')
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>Order Details</h1>
                    </div>

                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <!-- /.card-header -->
                            <!-- form start -->

                            <div class="card-body">
                                <div class="form-group">
                                    <label>ID: </label> {{ $getRecord->id }}
                                </div>
                                {{--  <div class="form-group">
                                    <label>Transaction ID: </label> {{ $getRecord->transaction_id }}
                                </div> --}}
                                <div class="form-group">
                                    <label>Name: </label> {{ $getRecord->first_name }} {{ $getRecord->last_name }}
                                </div>
                                <div class="form-group">
                                    <label>Company Name: </label> {{ $getRecord->company_name }}
                                </div>
                                <div class="form-group">
                                    <label>Country: </label> {{ $getRecord->country }}
                                </div>
                                <div class="form-group">
                                    <label>Address: </label>
                                    {{ $getRecord->address_one }}<br />{{ $getRecord->address_two }}
                                </div>
                                <div class="form-group">
                                    <label>City: </label> {{ $getRecord->city }}
                                </div>
                                <div class="form-group">
                                    <label>State: </label> {{ $getRecord->state }}
                                </div>
                                <div class="form-group">
                                    <label>Postcode: </label> {{ $getRecord->postcode }}
                                </div>
                                <div class="form-group">
                                    <label>Phone: </label> {{ $getRecord->phone }}
                                </div>
                                <div class="form-group">
                                    <label>Email: </label> {{ $getRecord->email }}
                                </div>
                                <div class="form-group">
                                    <label>Discount Code: </label> {{ $getRecord->discount_code }}
                                </div>
                                <div class="form-group">
                                    <label>Discount Amount ($): </label>
                                    {{ number_format($getRecord->discount_amount, 2) }}
                                </div>
                                <div class="form-group">
                                    <label>Shipping Name: </label> {{ $getRecord->getShipping->name }}
                                </div>
                                <div class="form-group">
                                    <label>Shipping Amount ($): </label>
                                    {{ number_format($getRecord->shipping_amount, 2) }}
                                </div>
                                <div class="form-group">
                                    <label>Total Amount ($): </label> {{ number_format($getRecord->total_amount, 2) }}
                                </div>
                                <div class="form-group">
                                    <label>Payment Method: </label> {{ $getRecord->payment_method }}
                                </div>
                                <div class="form-group">
                                    <label>Status: </label> {{ $getRecord->status }}
                                </div>
                                <div class="form-group">
                                    <label>Created Date: </label>
                                    {{ date('d-M-Y H:i A', strtotime($getRecord->created_at)) }}
                                </div>
                                {{-- <div class="form-group">
                                    <a href="{{ url('admin/orders/edit/'.$getRecord->id) }}" class="btn btn-primary btn-sm">Edit</a>
                                    <a href="{{ url('admin/orders/delete/'.$getRecord->id) }}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this record?');">Delete</a>
                                </div> --}}
                            </div>
                            <!-- /.card-body -->



                        </div>
                        <!-- /.card -->

                    </div>


                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Product Details</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0" style="overflow:auto;">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th>Product Name</th>
                                            <th>QTY</th>
                                            <th>Price</th>
                                            <th>Size Name</th>
                                            <th>Color Name</th>
                                            <th>Size Amount ($)</th>
                                            <th>Total Amount ($)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($getRecord->getItem as $item)
                                                @php
                                                    $getProductImage = $item->getProduct->getImageSingle($item->getProduct->id);
                                                @endphp
                                            <tr>
                                                <td>
                                                     <img style="width: 100px; height:100px;" src="{{ $getProductImage->getLogo() }}">
                                                </td>
                                                <td>
                                                    <a target="_blank" href="{{ url($item->getProduct->slug) }}">{{ $item->getProduct->title }}</a>
                                                </td>
                                                <td>{{ $item->getProduct->title }}</td>
                                                <td>{{ $item->quantity }}</td>
                                                <td>{{ number_format($item->price, 2) }}</td>
                                                <td>{{ $item->color_name }}</td>
                                                <td>{{ $item->size_name }}</td>
                                                <td>{{ number_format($item->size_amount, 2) }}</td>
                                                <td>{{ number_format($item->total_amount, 2) }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>

                    </div>
                </div>
        </section>
        <!-- /.content -->
    </div>
@endsection

@section('script')
    <script src="{{ url('public/assets/dist/js/pages/dashboard3.js') }}"></script>
@endsection
