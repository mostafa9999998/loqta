import 'package:flutter/material.dart';
import 'package:loqta/Ui/View/login/login%20screen.dart';
import 'package:loqta/Ui/View/register/register%20screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.loginname: (_) => LoginScreen(),
        RegisterScreen.registername: (_) => RegisterScreen()
      },
      initialRoute: LoginScreen.loginname,
    );
  }
}
