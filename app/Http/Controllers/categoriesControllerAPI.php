<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class categoriesControllerAPI extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = DB::table('categories')->get() ;
        if($categories->count() ==0){
            $res = [
                'message' => 'no results found' ,
                'status' => 404
            ];
        }else{
            $res = [
                'message' => 'all data here' ,
                'count' => $categories->count() ,
                'status' => 200 ,
                'data' => $categories
            ];
        }

        return response($res , 200) ;
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $category = DB::table('products')->where('categoryID' , $id)->get() ;
        if($category->count() == 0){
            $res = [
                'message' =>'category has no products' ,
                'status' => 404
            ];
        }else{
            $res = [
                'message' => 'all data' ,
                'count' => $category->count() ,
                'status' => 200 ,
                'data' => $category
            ];
        }

        return response($res , 200) ;
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
