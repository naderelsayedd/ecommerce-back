<?php

namespace App\Http\Controllers;

use App\Models\Orders;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ordersControllerAPI extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // $UserID = auth()->user()->id ;
        $productID = $request->id ;
        $order = DB::table('orders')->insert([
            'productID'=>$productID,
            'userId' =>1  ,
            'address' =>$request->address
        ]) ;

        if($order){
            $res = [
                'message' => 'order saved' ,
                'status' => 200 ,
                'order_data' =>$order
            ];

        }else{
            $res = [
                'message' => 'failed !' ,
                'status' =>404
            ];
        }

        return response($res , 200) ;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $userOrders = DB::table('ordersview')->where('userID' , $id)->get() ;
        if($userOrders->count() ==0 ){
            $res = [
                'message' => 'user has no orders yet' ,
                'status' => 404
            ] ;
        }else{
            $res = [
                'message' => 'all users orders ' ,
                'count' => $userOrders->count() ,
                'status' => 200 ,
                'data' => $userOrders
            ];
        }

        return response($res , 200 );
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
