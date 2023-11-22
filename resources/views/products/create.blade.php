@extends('layouts.app')

@section('content')
@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

@if(Session::has('done'))
<div class="alert alert-success" style="display: flex ;justify-content: space-between;">
    {{Session::get("done")}}
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
@endif
    <form action="{{route('product.store')}}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group mb-3">
            <label for="name">Product Name</label>
            <input type="text" placeholder="Product Name" name="name" id="name" class="form-control mt-3">
        </div>
        <div class="form-group mb-3">
            <label for="desc">Product Description</label>
            <input type="text" placeholder="Product Name" name="desc" id="desc" class="form-control mt-3">
        </div>
        <div class="form-group mb-3">
            <label for="price">Product Price</label>
            <input type="text" placeholder="Product price" name="price" id="price" class="form-control mt-3">
        </div>
        <div class="form-group mb-3">
            <label for="stock">Product Stock Count</label>
            <input type="number" placeholder="Product Stock count" name="stock" id="stock" class="form-control mt-3">
        </div>
        <div class="form-group mb-3">
            <label for="stock">Select Category</label>
            <select name="category" id="category" class="form-control mt-3">
                @forelse ($category as $item)
                        <option value="{{$item->id}}">{{$item->name}}</option>
                @empty
                    <option>No Categories Found</option>
                @endforelse
            </select>
        </div>
        <div class="form-group mt-3">
            <label for="file">
                <input type="file" name="file" id="file" class="form-control">
            </label>
        </div>
        <input type="submit" value="Add" class="btn btn-info form-control mt-5">
    </form>
@endsection
