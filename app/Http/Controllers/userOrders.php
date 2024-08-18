<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class userOrders extends Controller
{
    public function makeOrder(Request $request){
        // $UserID = auth()->user()->id ;
        $orders = DB::table('orders')->insert([
            'userId' => $request->id ,
            'productID' => $request->productID ,
            'address' => $request->address
        ]) ;

        if($orders != null){
            $res = [
                'message' => "product added to user cart" ,
                'status' => 200 ,
                'data'=> $orders
            ];
        }else{
            $res = [
                'message' => 'failed',
                'status' => 201 ,
            ];
        }

        return response($res , 200) ;
    }


    // get orders by user id
    public function userOrders($id){
        $orders = DB::table('userorders')->where('userID' , $id)->get();

        return $orders ;
    }

    public function delete($id){
        $delete = DB::table('orders')->where("id" , $id)->delete();

        if($delete){
            $res = [
                'message' => 'order calceled' ,
                'status' =>200
            ];
        }else{
            $res = [
                'message' => 'order not found' ,
                'status' => 404
            ];
        }

        return $res ;
    }
}
