import 'package:flutter/material.dart';
import 'package:loqta/Ui/View%20model/auth%20provider.dart';
import 'package:loqta/Ui/View/master%20screen/master%20screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/login screen.dart';

class DisplayWedget extends StatefulWidget {
  const DisplayWedget({super.key});
static String diplayname = 'DisplayWedgetname';

  @override
  State<DisplayWedget> createState() => _DisplayWedgetState();
}

class _DisplayWedgetState extends State<DisplayWedget> {
  @override
  String? userinfo;
  bool initial =true;

  Widget build(BuildContext context) {

    AuthProvider authProvider =Provider.of<AuthProvider>(context);
    if (initial){
    SharedPreferences.getInstance().then((value) {
      setState(()  {
        initial=false;
        //await
        userinfo = value.getString('login6key');
        authProvider.loading();
      });
    });
    return Center(child: CircularProgressIndicator());
  }else if (userinfo == null){
      return LoginScreen();
    }else {
     return MasterScreen();
    }


  }
}
