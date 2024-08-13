@extends('layouts.app')

@section('content')
    <h1 class="text-center">Ratings</h1>
    @if ($ratings->count() == 0)
        <h1 class="text-center text-danger">No Ratings Here</h1>
    @else
        <table class="table text-center fs-5">
            <thead>
                <tr>
                    <td>Name</td>
                    <td>Comment</td>
                    <td>Rate</td>
                    <td>Username</td>
                    <td>Approve</td>
                </tr>
            </thead>

            <tbody>
                @foreach ($ratings as $item)
                <tr>
                    <td>{{$item->productName}}</td>
                    <td>{{$item->comment}}</td>
                    <td>{{$item->rate}}</td>
                    <td>{{$item->userName}}</td>
                    <td>
                        @if ($item->status == 0)
                            <a class="text-danger" href="{{route('ratings.approve' , $item->productID)}}">Pending <i class="fa-solid fa-circle-xmark"></i></a>
                        @else
                            <p class="text-info">Approved <i class="fa-solid fa-check"></i></p>
                        @endif
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    @endif
@endsection
