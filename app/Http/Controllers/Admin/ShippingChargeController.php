<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\DiscountCodeModel;
use App\Models\ShippingChargeModel;

class ShippingChargeController extends Controller
{
    public function list()
    {
        $data['getRecord'] = ShippingChargeModel::getRecord();
        $data['header_title'] = 'Shipping Charge';
        return view('admin.shippingcharge.list', $data);
    }
    
    public function add()
    {
        $data['header_title'] = 'Add New Shipping Charge';
        return view('admin.shippingcharge.add', $data);
    }

    public function insert(Request $request)
    {

        $ShippingCharge = new ShippingChargeModel();
        $ShippingCharge->name = trim($request->name);
        $ShippingCharge->price = trim($request->price);
        $ShippingCharge->status = trim($request->status);
        $ShippingCharge->is_delete = 0;

        $ShippingCharge->save();

        return redirect('admin/shipping_charge/list')->with('success', "Shipping Charge successfully created");
    }
    public function edit($id)
    {
        $data['getRecord'] = ShippingChargeModel::getSingle($id);
        $data['header_title'] = 'Edit Shipping Charge';
        return view('admin.shippingcharge.edit', $data);
    }

    public function update($id, Request $request)
    {
        $ShippingCharge = ShippingChargeModel::getSingle($id);
        $ShippingCharge->name = trim($request->name);
        $ShippingCharge->price = trim($request->price);
        $ShippingCharge->status = trim($request->status);
        $ShippingCharge->is_delete = 0;

        $ShippingCharge->save();

        return redirect('admin/shipping_charge/list')->with('success', "Shipping Charge successfully updated");
    }
    public function delete($id)
    {
        $ShippingCharge = ShippingChargeModel::getSingle($id);
        $ShippingCharge->is_delete = 1;
        $ShippingCharge->save();

        return redirect()->back()->with('success', "Shipping Charge successfully deleted");
    }
}
