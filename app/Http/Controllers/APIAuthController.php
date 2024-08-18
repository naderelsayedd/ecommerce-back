<?php

namespace App\Http\Controllers;

use App\Models\User ;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class APIAuthController extends Controller
{
    public function register(Request $request){
        $data = $request->validate([
            'name'=>'required|string',
            'email'=>'required|string|unique:users,email',
            'password'=>'required','confirmed'
        ]);
        $user = User::create([
            'name'=>$data['name'],
            'email' =>$data['email'],
            'password'=>bcrypt($data['password'])
        ]);
        $token = $user->createToken("mytoken")->plainTextToken;

        $response = [
            "message" =>"Welcome in system" ,
            "user" =>$user ,
            "token" =>$token
        ];

        return response($response , 200) ;
    }

    public function logout(){
        auth()->user()->tokens()->delete();

        $response = [
            "message" =>"logout from system"
        ];

        return response($response , 200);
    }
    public function login(Request $request){
        $data = $request->validate([
            'email'=>'required|email',
            'password'=>'required'
        ]);
        $user = User::where("email" , "=" , $data['email'])->first();
        $token = $user->createToken("mytoken")->plainTextToken;

        if(!$user || !Hash::check($data['password'] , $user->password)){
            return ["message" =>"Login data is Not correct"];
        }

        $token = $user->createToken("mytoken")->plainTextToken;

        $response = [
            "message" =>"Welcome in system" ,
            "user" =>$user ,
            "token" =>$token ,
            "status" =>200
        ];

        return response($response , 200);
    }
}
