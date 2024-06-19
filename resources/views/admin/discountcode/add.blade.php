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
                        <h1>Add New Discount Code</h1>
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
                            <form action="" method="POST">
                                {{ csrf_field() }}
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Discount Code Name<span style="color:red">*</span> </label>
                                        <input type="text" class="form-control"  name="name" required value="{{ old('name') }}" placeholder="Discount Code Name">
                                    </div>

                                    <div class="form-group">
                                        <label>Type<span style="color:red">*</span></label>
                                        <select class="form-control" required name="type">
                                            <option {{ (old('type') == 'Amount') ? 'selected' : '' }} value="Amount">Amount</option>
                                            <option {{ (old('type') == 'Percent') ? 'selected' : '' }} value="Percent">Percent</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Amount / Percent<span style="color:red">*</span> </label>
                                        <input type="text" class="form-control"  name="percent_amount" required value="{{ old('percent_amount') }}" placeholder="Amount / Percent">
                                    </div>

                                    
                                    <div class="form-group">
                                        <label>Expire Date<span style="color:red">*</span> </label>
                                        <input type="date" class="form-control"  name="expire_date" required value="{{ old('expire_date') }}">
                                    </div>

                                    <div class="form-group">
                                        <label>Status<span style="color:red">*</span></label>
                                        <select class="form-control" required name="status">
                                            <option {{ (old('status') == 0) ? 'selected' : '' }} value="0">Active</option>
                                            <option {{ (old('status') == 1) ? 'selected' : '' }} value="1">Inactive</option>
                                        </select>
                                    </div>

                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                        <!-- /.card -->

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
