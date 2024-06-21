<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\OrderModel;
use Illuminate\Http\Request;
use App\Models\CategoryModel;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    public function list()
    {
        $data['getRecord'] = OrderModel::getRecord();
        $data['header_title'] = 'Orders';
        return view('admin.order.list', $data);
    }

    public function order_detail($id)
    {
        $data['getSingle'] = OrderModel::getSingle($id);
        $data['header_title'] = 'Order Detail';
        return view('admin.order.detail', $data);
    }

   
}
