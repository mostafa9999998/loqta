import 'package:flutter/material.dart';
import 'package:loqta/Ui/View/master%20screen/profile/Textfieldprofilestyle.dart';
import 'package:loqta/data/models/LoginResponse.dart';
import 'package:provider/provider.dart';

import '../../../View model/auth provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =Provider.of<AuthProvider>(context);
    LoginResponse loginResponse = authProvider.getloginResponse();

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height*.02,),
           /* Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*.1,
                    width: MediaQuery.of(context).size.width*.5,
                    child: Image.asset('assets/images/logotext.png',fit: BoxFit.fill),
                  )
                ]),*/
           // SizedBox(height:MediaQuery.of(context).size.height*.02,),
            TextProfileStyle(title: 'Name',name: 'name', lable: loginResponse.user!.name!),
            TextProfileStyle(title: 'Phone Num 1',name: 'phonenum1', lable: loginResponse.user!.phonenum1!),
            TextProfileStyle(title: 'Phone Num 2',name: 'phonenum2', lable: loginResponse.user!.phonenum2!),
            TextProfileStyle(title: 'Adress',name: 'address', lable: loginResponse.user!.address!),
          ],
        ),
      ),
    );
  }
}
