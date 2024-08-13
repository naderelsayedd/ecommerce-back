@extends('layouts.app')

@section('content')
@if(Session::has('done'))
            <div class="alert alert-success" style="display: flex ;justify-content: space-between;">
                {{Session::get("done")}}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
@endif

@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
    <form class="form" method="post" action="{{route('category.update' , $category->id)}}">
        @csrf
        <div class="form-group">
            <h2 class="text-center mb-5">Edit Category : {{$category->name}}</h2>
            <label for="name">Category Name</label>
            <input class="form-control mt-3" type="text" name="name" id="name" value="{{$category->name}}" placeholder="Category Name" required>
            <input type="submit" value="Save Changes"  class="btn btn-warning mt-5">
        </div>
    </form>
@endsection
