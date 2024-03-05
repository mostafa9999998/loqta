import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  late int userid ;
  void setuserid(int id){
    userid = id;
  }
  int detuserid (){
    return userid ;
  }
}