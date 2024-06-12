<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class ProductModel extends Model
{
    use HasFactory;
    protected $table = 'product';


    public static function getSingle($id)
    {
        return self::find($id);
    }

    public static function getRecord()
    {
        return self::select('product.*' , 'users.name as created_by_name')
        ->join('users','users.id','=','product.created_by')
        ->where('product.is_delete', '=', 0)
        ->orderBy('product.id','desc')
        ->paginate(5);
    }

    public static function checkSlug($slug)
    {
        return self::where('slug','=',$slug)->count();
    }

    public function getColor()
    {
        return $this->hasMany(ProductColorModel::class, "product_id");
    }

    public function getSize()
    {
        return $this->hasMany(ProductSizeModel::class, "product_id");
    }

    public function getImage()
    {
        return $this->hasMany(ProductImageModel::class, "product_id")->orderBy('order_by','asc');
    }
}
