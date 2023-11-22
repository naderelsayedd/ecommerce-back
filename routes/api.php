<?php

use App\Http\Controllers\APIAuthController;
use App\Http\Controllers\categoriesControllerAPI;
use App\Http\Controllers\categoryControllerAPI;
use App\Http\Controllers\ordersControllerAPI;
use App\Http\Controllers\productsControllerAPI;
use App\Http\Controllers\ratingController;
use App\Http\Controllers\reviews;
use App\Http\Controllers\userOrders;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// login and register routing
Route::prefix('user')->group(function(){
    Route::post('register' , [APIAuthController::class , 'register'])->name('register');
    Route::post('login' , [APIAuthController::class , 'login'])->name('login');
}) ;

Route::middleware('auth:sanctum')->group(function(){
    // products api routing
Route::resources([
    "products" => productsControllerAPI::class
]) ;

// search routing
Route::get('search' , [productsControllerAPI::class , 'search'])->name('product/search');

// product reviews and comments routing
Route::get('reviews/{id}' , [reviews::class , 'productReviews'])->name('reviews') ;
Route::post('reviews/store' , [ratingController::class , 'store'])->name('ratings.store') ;
// categories api routing
Route::resources([
    "categories" => categoriesControllerAPI::class
]) ;

// orders api routing
Route::resources([
    "orders" => ordersControllerAPI::class
]) ;

Route::get('logout' ,[APIAuthController::class , 'logout']);

}) ;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// user make orders
Route::post('orders/create' , [userOrders::class , 'makeOrder'])->name('orders/make');
Route::delete('orders/delete/{id}' , [userOrders::class , 'delete'])->name('orders/delete');

// show users orders
Route::get('orders/userShow/{id}' , [userOrders::class , 'userOrders'])->name('userOrders');
