<?php

namespace App\Http\Controllers;

use App\Models\Products;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class productsController extends Controller
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
        $products = DB::table('productscategory')->get() ;
        return view('products.index' , compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $category = DB::table('categories')->get() ;
        return view('products.create' , compact('category'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request) ;
        $request->validate([
            'name' =>'required|min:5|string' ,
            'desc'=>'required|string|min:5' ,
            'price' =>'required|numeric' ,
            'stock' =>'required|integer',
            'category' =>'required' ,
            'file' =>'required|mimes:jpeg,png,webp|max:2048'
        ]);

        $product = new Products () ;
        $product->name = $request->name ;
        $product->desc = $request->desc ;
        $product->price = $request->price ;
        $product->stock = $request->stock ;
        $product->categoryID = $request->category ;

        $product_data =$request->file('file') ;

        $product_name =time() . '_'.$product_data->getClientOriginalName() ;
        $location = public_path('./upload/products') ;
        $product_data->move($location , $product_name);

        // upload
        $product->file = $product_name ;
        $product->save();

        return redirect()->back()->with('done' , 'Product Saved !') ;
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
        $product = Products::find($id)->delete();

        return redirect()->back()->with('done' , 'Product Deleted !');
    }
}
