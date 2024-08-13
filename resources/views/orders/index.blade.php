@extends('layouts.app')

@section('content')
    <h1 class="text-center">Orders</h1>
    @if ($orders->count() == 0)
        <h1 class="text-center text-danger">No Orders Now</h1>
    @else
        <table class="table fs-5 text-center mt-5">
            <thead>
                <tr>
                    <td>Product Name</td>
                    <td>Price</td>
                    <td>Customer</td>
                    <td>Adress</td>
                    <td>Status</td>
                </tr>
            </thead>
            <tbody>
                @foreach($orders as $order)
                    <tr>
                        <td>{{$order->name}}</td>
                        <td>{{$order->price}}</td>
                        <td>{{$order->username}}</td>
                        <td>{{$order->address}}</td>
                        <td>
                            @if($order->status == 0)
                            <a href="{{route('orders.approve' , $order->productID)}}" class="text-danger">Pending    <i class="fa-solid fa-circle-xmark "></i></a>
                            @else
                            <p class="text-info">Delivered    <i class="fa-solid fa-check"></i></p>
                             @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endif
@endsection
