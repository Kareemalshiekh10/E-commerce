<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\DiscountCodeModel;

class DiscountCodeController extends Controller
{
    public function list()
    {
        $data['getRecord'] = DiscountCodeModel::getRecord();
        $data['header_title'] = 'Discount Code';
        return view('admin.discountcode.list', $data);
    }
    
    public function add()
    {
        $data['header_title'] = 'Add New Discount Code';
        return view('admin.discountcode.add', $data);
    }

    public function insert(Request $request)
    {

        $DiscountCode = new DiscountCodeModel();
        $DiscountCode->name = trim($request->name);
        $DiscountCode->type = trim($request->type);
        $DiscountCode->percent_amount = trim($request->percent_amount);
        $DiscountCode->expire_date = trim($request->expire_date);
        $DiscountCode->status = trim($request->status);
        $DiscountCode->is_delete = 0;

        $DiscountCode->save();

        return redirect('admin/discount_code/list')->with('success', "Discount Code successfully created");
    }
    public function edit($id)
    {
        $data['getRecord'] = DiscountCodeModel::getSingle($id);
        $data['header_title'] = 'Edit Discount Code';
        return view('admin.discountcode.edit', $data);
    }
    public function update($id, Request $request)
    {
        $DiscountCode = new DiscountCodeModel();
        $DiscountCode->name = trim($request->name);
        $DiscountCode->type = trim($request->type);
        $DiscountCode->percent_amount = trim($request->percent_amount);
        $DiscountCode->expire_date = trim($request->expire_date);
        $DiscountCode->status = trim($request->status);
        $DiscountCode->is_delete = 0;
        $DiscountCode->is_delete = 0;

        $DiscountCode->save();

        return redirect('admin/discount_code/list')->with('success', "Discount Code successfully updated");
    }

    public function delete($id)
    {
        $DiscountCode = DiscountCodeModel::getSingle($id);
        $DiscountCode->is_delete = 1;
        $DiscountCode->save();

        return redirect()->back()->with('success', "Discount Code successfully deleted");
    }
}
