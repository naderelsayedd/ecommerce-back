@extends('layouts.app')

@section('content')
   @if ($products->isEmpty())
        <h1 class="text-center text-danger">No Products Found</h1>
   @else
   <h1 class="text-center text-info">Products List</h1>
        <table class="table">
            <thead>
                <tr>
                    <td>Name</td>
                    <td>Category</td>
                    <td>Stock Count</td>
                    <td>Action</td>
                </tr>
            </thead>
            <tbody>
                @foreach ($products as $item)
                <tr>
                    <td>{{$item->productName}}</td>
                    <td>{{$item->categoryName}}</td>
                    <td>{{$item->stock}} Items Left</td>
                    <td>
                        <a class="text-danger" href="{{route('product.destroy' , $item->productID)}}">Delete</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
   @endif
</table>
    <a href="{{route('product.create')}}">Add</a>
@endsection
