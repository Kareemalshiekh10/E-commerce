<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
/* use anayarojo\shoppingcart\Cart; */
use Cart;
/* use darryldecode\src\Darryldecode\Cart;  */
use App\Models\ProductModel;
use App\Models\ProductSizeModel;
/* use Gloudemans\Shoppingcart\Cart; */


class PaymentController extends Controller
{

    public function cart(Request $request)
    {
        $data['meta_title'] = 'Cart';
        $data['meta_description'] = '';
        $data['meta_keywords'] = '';
       return view('payment.cart',$data);
    }

    public function cart_delete($rowId)
    {
        Cart::remove($rowId);
        return redirect()->back();
    }
    
    public function add_to_cart(Request $request)
    {
        $getProduct = ProductModel::getSingle($request->product_id);
        $total = $getProduct->price;
        if(!empty($request->size_id))
        {
            $size_id = $request->size_id;
            $getSize = ProductSizeModel::getSingle($size_id);

            $size_price = !empty($getSize->price) ? $getSize->price : 0;
            $total =  $total + $size_price;
        }
        else
        {
            $size_id = 0;
        }
        $color_id = !empty($request->color_id) ? $request->color_id : 0;
        Cart::add([
            'id' => $getProduct->id,
            'name' => $getProduct->title,
            'qty' => $request->qty,
            'price' => $total,
            'weight' => 0,
            'options' => [
                'size_id' => $size_id,
                'color_id' => $color_id,
                'size_name' => !empty($getSize->name) ? $getSize->name : '',
                'image' => $getProduct->image,
            ]
        ]);
        
        return redirect()->back();
    }

    public function checkout(Request $request)
    {
        $data['meta_title'] = 'Checkout';
        $data['meta_description'] = '';
        $data['meta_keywords'] = '';
        return view('payment.checkout',$data);
    }

   /*  public function update_cart(Request $request)
    {
        foreach($request->cart as $cart)
        {
            Cart::update($cart['id'], array(
                'qty' => array(
                'relative' => false,
                'value' => $cart['qty']
            ),
            ));

        }
        return redirect()->back();
    } */

    public function update_cart(Request $request)
    {
        $quantities = $request->input('quantities', []);

        foreach ($quantities as $rowId => $quantity) {
            Cart::update($rowId, $quantity);
        }

        return redirect()->back();
    }
}
