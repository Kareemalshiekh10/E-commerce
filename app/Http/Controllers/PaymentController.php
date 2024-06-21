<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

/* use anayarojo\shoppingcart\Cart; */
/* use Gloudemans\Shoppingcart\Cart; */
/* use darryldecode\src\Darryldecode\Cart;  */
use Cart;
use App\Models\User;
use Illuminate\Support\Facades\Hash;    
use App\Models\ProductModel;
use App\Models\ProductSizeModel;
use App\Models\DiscountCodeModel;
use App\Models\ColorModel;  
use App\Models\ShippingChargeModel;
use App\Models\OrderModel;
use App\Models\OrderItemModel;
use Dompdf\Css\Color;
use Illuminate\Support\Facades\Auth;

class PaymentController extends Controller
{

    public function apply_discount_code(Request $request)
    {
        $getDiscount = DiscountCodeModel::CheckDiscount($request->discount_code);
        if(!empty($getDiscount))
        {
            $total = Cart::SubTotal();
            if($getDiscount->type == 'Amount')
            {
                $discount_amount = $getDiscount->percent_amount;
                $payable_total = $total - $getDiscount->percent_amount;
            }
            else
            {
                $discount_amount = ($total * $getDiscount->percent_amount) / 100;
                $payable_total = $total - $discount_amount ;
            }
            $json['status'] = true;
            $json['discount_amount'] = number_format($discount_amount,2);
            $json['payable_total'] = $payable_total;
            $json['message'] = 'Success';
        }
        else
        {
            $json['status'] = false;
            $json['discount_amount'] = '0.00';
            $json['payable_total'] = Cart::SubTotal();
            $json['message'] = 'Invalid Discount Code';
        }
        echo json_encode($json);
    }

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
        $data['getShipping'] = ShippingChargeModel::getRecordActive();
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

    public function place_order(Request $request)
    {
        $validate = 0;
        $message = '';
        if(!empty(Auth::check()))
        {
            $user_id = Auth::user()->id;
        }
        else
        {
            if(!empty($request->is_create))
            {
                $checkEmail = User::checkEmail($request->email);
                if(!empty($checkEmail))
                {
                    $message = 'Email already exists';
                    $validate = 1;
                }
                else
                {
                    $save = new User;
                    $save->name = trim($request->first_name);
                    $save->email = trim($request->email);                           
                    $save->password = Hash::make($request->password);
            
                    $save->save();
                    $user_id = $save->id;
                }
            }
            else
            {
                $user_id = '';
            }
        }
       
        if(empty($validate))
        {
            $getShipping = ShippingChargeModel::getSingle($request->shipping);
            $payable_total = Cart::SubTotal();
            $discount_amount = 0;
            $discount_code = '';
            if(!empty($request->discount_code))
            {
                $getDiscount = DiscountCodeModel::CheckDiscount($request->discount_code);
                if(!empty($getDiscount));
                {
                    if($getDiscount->type == 'Amount')
                    {
                        $discount_code = $request->discount_code;
                        $discount_amount = $getDiscount->percent_amount;
                        $payable_total = $payable_total - $getDiscount->percent_amount;
                    }
                    else
                    {
                        $discount_amount = ($payable_total * $getDiscount->percent_amount) / 100;
                        $payable_total = $payable_total - $discount_amount ;
                    }
    
                }
               
            }
            $shipping_amount = !empty($getShipping->price) ? $getShipping->price : 0;
            $total_amount = $payable_total + $shipping_amount;
    
    
            $order = new OrderModel;
            if(!empty($user_id))
            {
                $order->user_id = trim($user_id);
            }
            $order->first_name = trim($request->first_name);
            $order->last_name = trim($request->last_name);
            $order->company_name = trim($request->company_name);
            $order->country = trim($request->country);
            $order->address_one = trim($request->address_one);
            $order->address_two = trim($request->address_two);
            $order->city = trim($request->city);
            $order->state = trim($request->state);
            $order->postcode = trim($request->postcode);
            $order->phone = trim($request->phone);
            $order->email = trim($request->email);
            $order->note = trim($request->note);
            $order->discount_amount = trim($discount_amount);
            $order->discount_code = trim($discount_code);
            $order->shipping_id = trim($request->shipping);
            $order->shipping_amount = trim($shipping_amount);
            $order->total_amount = trim($total_amount);
        
            $order->payment_method = trim($request->payment_method);
    
            $order->save();
    
            foreach (Cart::content() as $key=>$cart)
            {
                $order_item = new OrderItemModel;
                $order_item->order_id = $order->id; 
                $order_item->product_id = $cart->id;
                $order_item->quantity = $cart->qty;
                $order_item->price = $cart->price;
    
                // Check if attributes are set
            if (isset($cart->options) && isset($cart->options['color_id'])) {
                $color_id = $cart->options['color_id'];
                if (!empty($color_id)) {
                    $getColor = ColorModel::getSingle($color_id);
                    $order_item->color_name = $getColor ? $getColor->name : null;
                }
            }
    
            if (isset($cart->options) && isset($cart->options['size_id'])) {
                $size_id = $cart->options['size_id'];
                if (!empty($size_id)) {
                    $getSize = ProductSizeModel::getSingle($size_id);
                    $order_item->size_name = $getSize ? $getSize->name : null;
                    $order_item->size_amount = $getSize ? $getSize->price : null;
                }
            }
                
                $order_item->total_price = $cart->price;
                $order_item->save();
    
            }
            $json['status'] = true;
            $json['message'] = 'Order placed successfully';
            $json['redirect'] = url('checkout/payment?order_id='.base64_encode($order->id));
        }
        else
        {
            $json['status'] = false;
            $json['message'] = $message;
        }
        echo json_encode($json);
        
    }

    public function checkout_payment(Request $request)
    {
        if(!empty(Cart::subtotal()) && !empty($request->order_id))
        {
            $order_id = base64_decode($request->order_id);
            $getOrder = OrderModel::getSingle($order_id);
            if(!empty($getOrder))
            {
                if($getOrder->payment_method == 'cash')
                {
                    $getOrder->is_payment = 1;
                    $getOrder->save();

                    Cart::destroy();
                    return redirect('cart')->with('success', "Order placed successfully");
                }
                else if($getOrder->payment_method == 'paypal')
                {
                    $getOrder->is_payment = 1;
                    $getOrder->save();

                    Cart::destroy();
                    return redirect('cart')->with('success', "Order placed successfully");

                }
                else if($getOrder->payment_method == 'stripe')
                {
                    $getOrder->is_payment = 1;
                    $getOrder->save();

                    Cart::destroy();
                    return redirect('cart')->with('success', "Order placed successfully");
                }
            }
            else
            {
                abort(404);
            }
        }
        else
        {
            abort(404);
        }
    }
}