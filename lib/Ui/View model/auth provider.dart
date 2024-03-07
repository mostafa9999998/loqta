import 'package:flutter/material.dart';
import 'package:loqta/data/models/LoginResponse.dart';

class AuthProvider extends ChangeNotifier{
  late int userid ;
  late LoginResponse loginResponse;

  void setuserid(int id){
    userid = id;
  }
  int detuserid (){
    return userid ;
  }

  setuserinfo(LoginResponse userinfo){
    loginResponse=userinfo;
  }
  LoginResponse getloginResponse(){
    return loginResponse;
  }
}