<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class reviews extends Controller
{
    public function productReviews($id){
        $reviews = DB::table('productsratings')->where("productID" , $id)->orderBy('date' , 'desc')->get() ;

        return $reviews ;
    }
}
