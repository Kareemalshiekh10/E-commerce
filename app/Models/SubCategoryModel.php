<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategoryModel extends Model
{
    use HasFactory;
    protected $table = 'sub_category';

    static public function getSingle($id)
    {
        return self::find($id);
    }

    static public function getRecord()
    {
        return self::select('sub_category.*','users.name as created_by_name','category.name as category_name')
            ->join('category','category.id','=','sub_category.category_id')
            ->join('users','users.id','=','sub_category.created_by')
            ->where('sub_category.is_delete', '=', 0)  // Exclude deleted records
            ->orderBy('sub_category.id', 'desc')
            ->paginate(1);
    }

    static public function getRecordCategory($category_id)
    {
        return self::select('sub_category.*')
            ->join('users','users.id','=','sub_category.created_by')
            ->where('sub_category.is_delete', '=', 0) 
            ->where('sub_category.status', '=', 0) 
            ->where('sub_category.category_id', '=', $category_id) 
            ->orderBy('sub_category.name', 'asc')
            ->get();
    }

    // The following function name must match the AJAX call in the controller
    static public function getRecordSubCategory($category_id)
    {
        return self::getRecordCategory($category_id);
    }
}
