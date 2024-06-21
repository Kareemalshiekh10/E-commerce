<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItemModel extends Model
{
    use HasFactory;
    protected $table = 'orders_item';

    static public function DeleteRecord($product_id)
    {
        self::where('product_id','=',$product_id)->delete();
    }

    public function getColor()
    {
        return $this->belongsTo(ColorModel::class, 'color_id');
    }
}
