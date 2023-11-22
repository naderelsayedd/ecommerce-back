<?php

namespace App\Http\Controllers;

use App\Models\Rating;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ratingController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ratings = DB::table('productsratings')->get() ;

        return view('ratings.index')->with('ratings' , $ratings) ;
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
        $request->validate([
            'comment' => 'required|min:5|string'
        ]) ;

        $rate = DB::table('ratings')->insert([
            'productID' =>$request->id ,
            'userID' =>$request->userid,
            'rate' => $request->rate ,
            'comment' =>$request->comment
        ]) ;

        if($rate){
            $res = [
                'message' => 'your rate send' ,
                'status' => 200 ,
                'data' => $rate
            ];
        } else{
            $res = [
                'message' => 'failed' ,
                'status'=> 500 ,
            ] ;
        }

        return response($res , 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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

    public function approve($id){
        $item = DB::table('ratings')->where('productID' , $id);
        $item->update([
            'status' => 1
        ]);

        return redirect()->route('ratings.index');
    }

}
