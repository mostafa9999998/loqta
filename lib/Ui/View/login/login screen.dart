import 'package:flutter/material.dart';
import 'package:loqta/Ui/View/login/textfield%20wedget.dart';
import 'package:loqta/Ui/View/register/register%20screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static  String loginname = 'LoginScreen ';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController logincontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  bool obsecure = true ;

  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                Text('loginScreen'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
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
                    login();
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
                    Text("     Don't have account  ",style: TextStyle(fontSize: 20),textAlign: TextAlign.center),
                    InkWell(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, RegisterScreen.registername);
                        },
                        child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20, color: Color(0xefe817c3)),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {}
}
