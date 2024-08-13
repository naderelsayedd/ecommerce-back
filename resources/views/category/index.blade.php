@extends('layouts.app')

@section('content')
    <h3 class="text-center text-info">All Categories</h3>
    @if(Session::has('done'))
            <div class="alert alert-success" style="display: flex ;justify-content: space-between;">
                {{Session::get("done")}}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif
        <table class="table">
            <thead>
                <tr>
                    <td>Name</td>
                    <td>Created At</td>
                    <td>Last Update</td>
                    <td>Action</td>
                </tr>
            </thead>
            <tbody>
                @forelse ($category as $item)
                    <tr>
                        <td>{{$item->name}}</td>
                        <td>{{$item->created_at}}</td>
                        <td>{{$item->updated_at}}</td>
                        <td>
                            <a href="{{route('category.edit' , $item->id)}}" class="text-info">Edit</a>
                            <a href="{{route('category.destroy' , $item->id)}}" class="text-danger">Delete</a>
                        </td>
                    </tr>
                @empty
                    <h5 class="text-center">No Data Found</h5>
                @endforelse
    <a href="{{route('category.create')}}" class="text-primary text-right">Add New</a>

            </tbody>
        </table>
@endsection
