import 'package:flutter/material.dart';
import 'package:loqta/Ui/View%20model/auth%20provider.dart';
import 'package:loqta/Ui/View%20model/main%20provider.dart';
import 'package:loqta/Ui/View/display%20wedget/display%20wedget.dart';
import 'package:loqta/Ui/View/login/login%20screen.dart';
import 'package:loqta/Ui/View/master%20screen/category/product/product%20screen.dart';
import 'package:loqta/Ui/View/master%20screen/master%20screen.dart';
import 'package:loqta/Ui/View/register/register%20screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var provider =AuthProvider();
 // await provider.loading();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>MainProvider() ,),
        ChangeNotifierProvider(create: (context) =>AuthProvider() ,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.loginname: (_) => LoginScreen(),
          RegisterScreen.registername: (_) => RegisterScreen(),
          MasterScreen.masterScreenname : (_) => MasterScreen(),
          ProductScreen.ProductScreenname : (_) => ProductScreen(),
          DisplayWedget.diplayname : (_) => DisplayWedget()
        },
        initialRoute:  DisplayWedget.diplayname,
      ),
    );
  }
}
