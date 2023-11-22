<?php

use App\Http\Controllers\categoryController;
use App\Http\Controllers\orders;
use App\Http\Controllers\productsController;
use App\Http\Controllers\ratingController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

// categories routing
Route::prefix('category')->group(function(){
    Route::get('index' , [categoryController::class , 'index'])->name('category.index') ;
    Route::get('create' , [categoryController::class , 'create'])->name('category.create');
    Route::post('store' , [categoryController::class , 'store'])->name('category.store');


    // routes use item id
    Route::get('edit/{id}' , [categoryController::class , 'edit'])->name('category.edit') ;
    Route::post('update/{id}' , [categoryController::class , 'update'])->name('category.update') ;
    Route::get('destroy/{id}' , [categoryController::class , 'destroy'])->name('category.destroy') ;
});
// products routing
Route::prefix('product')->group(function(){
    Route::get('index' , [productsController::class , 'index'])->name('product.index') ;
    Route::get('create' , [productsController::class , 'create'])->name('product.create');
    Route::post('store' , [productsController::class , 'store'])->name('product.store');


    // routes use item id
    Route::get('edit/{id}' , [productsController::class , 'edit'])->name('product.edit') ;
    Route::post('update/{id}' , [productsController::class , 'update'])->name('product.update') ;
    Route::get('destroy/{id}' , [productsController::class , 'destroy'])->name('product.destroy') ;
});

// ratings routing
Route::prefix('ratings')->group(function(){
    Route::get('index' , [ratingController::class , 'index'])->name('ratings.index') ;


    // routes use item id
    Route::get('approve/{id}' , [ratingController::class , 'approve'])->name('ratings.approve') ;
});


// orders routing
Route::prefix('orders')->group(function(){
    Route::get('index' ,[ orders::class , 'index'])->name('orders.index');

    Route::get('approve/{id}' , [orders::class , 'approve'])->name('orders.approve') ;

}) ;
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
