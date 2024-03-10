import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loqta/data/models/LoginResponse.dart';
import 'package:loqta/data/models/user%20in%20shared%20prefrence.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{
  late int userid ;
  late LoginResponse loginResponse;
  SharedPreferences? prefs;
  static String logintypekey ='login1key';
  static String loginnamekey ='login2key';
  static String loginemailkey ='login3key';
  static String loginaddresskey ='login4key';
  static String loginidkey ='login5key';
  static String loginphone1key ='login6key';
  static String loginphonenum2key ='login7key';
  static String logintypeidkey ='login8key';

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


  Future<void> setlogintype(String loginrespons) async{
    await prefs!.setString(logintypekey, loginrespons);
  }
  String? getlogintype(){
    return prefs!.getString(logintypekey);
  }


  Future<void> setloginid(int loginrespons) async{
    await prefs!.setInt(loginidkey, loginrespons);
  }
  int? getloginid(){
    return prefs!.getInt(loginidkey);
  }


  Future<void> setloginname(String loginrespons) async{
    await prefs!.setString(loginnamekey, loginrespons);
  }
  String? getloginname(){
    return prefs!.getString(loginnamekey);
  }


  Future<void> setloginemail(String loginrespons) async{
    await prefs!.setString(loginemailkey, loginrespons);
  }
  String? getloginemail(){
    return prefs!.getString(loginemailkey);
  }


  Future<void> setloginaddress(String loginrespons) async{
    await prefs!.setString(loginaddresskey, loginrespons);
  }
  String? getloginaddress(){
    return prefs!.getString(loginaddresskey);
  }


  Future<void> setloginphonenum1(String loginrespons) async{
    await prefs!.setString(loginphone1key, loginrespons);
  }
  String? getloginphonenum1(){
    return prefs!.getString(loginphone1key);
  }


  Future<void> setloginphonenum2(String loginrespons) async{
    await prefs!.setString(loginphonenum2key, loginrespons);
  }
  String? getloginphonenum2(){
    return prefs!.getString(loginphonenum2key);
  }


  Future<void> setlogintypeid(int loginrespons) async{
    await prefs!.setInt(logintypeidkey, loginrespons);
  }
  int? getlogintypeid(){
    return prefs!.getInt(logintypeidkey);
  }



  Future<void> loading() async{
    prefs = await SharedPreferences.getInstance();

    if (getloginphonenum1() != null){
       String s =getloginphonenum1()!;
       //final jsonMap = Map<String,dynamic>.from(json.decode(s));
        //var b = SharedResponse.fromJson(jsonMap);
       //var b =  SharedResponse.fromJson(jsonDecode(s));
       print('$s=======================================================================');
       //print(b.toJson().toString());
       LoginResponse lo = LoginResponse(type: getlogintype(),
       user: User(
         name: getloginname(),
           address:getloginaddress() ,
           id:getloginid() ,
           email: getloginemail() ,
           phonenum1:getloginphonenum1() ,
           phonenum2: getloginphonenum2(),
           typeId: getlogintypeid()
       )
       );
       setuserinfo(lo);
       setuserid(getloginid()!);
    }
  }

}




/*

SharedPreferences? prefs;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 var provider =Settingprovider();
 await provider.loading();
  runApp(
       ChangeNotifierProvider(
           create: (context)=>provider,
           child: Myapp()));
}



Future<void> setlocal(String newlocal) async{
  await prefs!.setString(localkey, newlocal);
}
String? getlocal(){
  return prefs!.getString(localkey);
}

Future<void> loading() async{
  prefs = await SharedPreferences.getInstance();

  if (getlocal() != null){
    currentlocal = getlocal()!;
  }

  if (getmoode() != null){
    mode = (getmoode()=='light'?ThemeMode.light:ThemeMode.dark);
  }
}

*/