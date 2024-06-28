<?php

namespace App\Http\Controllers;

use App\Models\CategoryModel;
use App\Models\ProductModel;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function home()
    {
            $data['meta_title'] = 'Intell$Mart';
            $data['meta_description'] = '';
            $data['meta_keywords'] = '';
            $data['getCategory'] = CategoryModel::getRecordActiveHome();
            $data['getProduct'] = ProductModel::getRecentArrival();
            $data['getProductTrendy'] = ProductModel::getProductTrendy();
        return view('home',$data);
    }

    public function recent_arrival_category_product(Request $request)
    {
        $getProduct = ProductModel::getRecentArrival();
        $getCategory = CategoryModel::getSingle($request->category_id);
        return response()->json([
            "status" => true,
            "success" => view('product._list_recent_arrival',[
                "getProduct"  => $getProduct,
                "getCategory" => $getCategory,
            ])->render(),
            ],200);
    }
}
