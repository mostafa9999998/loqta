import 'package:flutter/material.dart';
import 'package:loqta/Ui/Utiles/color%20file.dart';
import 'package:loqta/Ui/View/master%20screen/category/category%20screen.dart';
import 'package:loqta/Ui/View/master%20screen/home/home%20screen.dart';
import 'package:loqta/Ui/View/master%20screen/order/order%20screen.dart';
import 'package:loqta/Ui/View/master%20screen/profile/profile%20screen.dart';
import 'package:provider/provider.dart';

import '../../View model/main provider.dart';
import '../login/login screen.dart';


class MasterScreen extends StatefulWidget {
   MasterScreen({super.key});
   static  String masterScreenname = 'MasterScreen ';
  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {

  @override
  Widget build(BuildContext context) {
    MainProvider provider =Provider.of(context);

    int currentindex = provider.currentindex ;
    return WillPopScope(
      onWillPop: ()async {
        return false ;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:  Container(
            height: MediaQuery.of(context).size.height*.05,
            width: MediaQuery.of(context).size.width*.3,
            child: Center(child: Image.asset('assets/images/logotext.png',fit: BoxFit.fill)),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, LoginScreen.loginname);
              },
              child: Icon(Icons.logout, color: ColorApp.primarycolor,size: 30),
            ),
            SizedBox(width:MediaQuery.of(context).size.width*.03 ,)
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight:  Radius.circular(30)
          ),
          child: BottomNavigationBar(
         //   enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorApp.primarycolor,
            currentIndex: currentindex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black ,
            onTap: (value) {
              provider.setcurrentindex(value) ;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), //ImageIcon(AssetImage('assets/images/home.png')),
                label: 'home'
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/category.png')),
                label: 'category'
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/orders.png')),
                label: 'order'
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/person.png')),
                label: 'profile'
              ),
            ],
          ),
        ),
        body: screens[currentindex],
      ),
    );
  }
  List screens = [Home(),CategoryScreen(),OrderScreen(),ProfileScreen()];
}
