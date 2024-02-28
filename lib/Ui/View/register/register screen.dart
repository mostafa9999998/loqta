import 'package:flutter/material.dart';
import 'package:loqta/Ui/Utiles/color%20file.dart';
import 'package:loqta/Ui/View/login/login%20screen.dart';

import '../login/textfield wedget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
static  String registername = 'RegisterScreen ';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController logincontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();

  bool obsecure = true ;

  GlobalKey<FormState> formkey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primarycolor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  Text('RegisterScreen'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Text(
                    'name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  TextFieldWedget(
                      hint: 'Name',
                      cotroler: namecontroller,
                      Validfunction: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return "name can't be empty";
                        }
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Text(
                    'Email address',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  TextFieldWedget(
                      hint: 'You@Example.com',
                      cotroler: logincontroller,
                      Validfunction: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return "e-mail can't be empty";
                        }
                        bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'please enter valid e-mail';
                        }
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Text(
                    'phone',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  TextFieldWedget(
                      hint: 'phone num',
                      cotroler: phonecontroller,
                      Validfunction: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return "phone can't be empty";
                        }
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  TextFieldWedget(
                    hint: 'your Password',
                    cotroler: passwordcontroller,
                    obsec: obsecure,
                    Validfunction: (value) {
                      if (value!.isEmpty || value.trim().isEmpty) {
                        return "password can't be empty";
                      } else if (value.length < 8) {
                        return 'password shoud be at least 8 Characters';
                      }
                    },
                    suffixIcon: InkWell(
                        onTap: () {
                          if (obsecure == true) {
                            obsecure = false;
                          } else {
                            obsecure = true;
                          }
                          setState(() {});
                        },
                        child: obsecure ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width*0.9,
                    height:MediaQuery.sizeOf(context).width*0.15 ,
                    child: ElevatedButton(onPressed: (){
                      register();
                      //  Navigator.pushReplacementNamed(context, Selectscreen.selectname);
                    },
                      child: Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:Color(0xefe817c3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Text("already have an account  ",style: TextStyle(fontSize: 20),textAlign:TextAlign.center),
                      InkWell(
                          onTap: (){
                             Navigator.pushReplacementNamed(context, LoginScreen.loginname);
                          },
                          child: Text('Sign in',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20, color: Color(0xefe817c3)),)),
                    ],
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {}
}
