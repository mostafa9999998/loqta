import 'package:flutter/material.dart';
import 'package:loqta/Ui/Utiles/circler%20indecator.dart';
import 'package:loqta/Ui/Utiles/color%20file.dart';
import 'package:loqta/Ui/View%20model/auth%20provider.dart';
import 'package:loqta/data/api%20manager/Api%20manager.dart';
import 'package:provider/provider.dart';

class UpdateButtomSheet extends StatelessWidget {
  UpdateButtomSheet({super.key, required this.lable, required this.name});
  String lable;
  String name;
  TextEditingController m =TextEditingController();
  @override
  Widget build(BuildContext context) {
    m.text = lable;
    return Container(
      margin: EdgeInsets.all( MediaQuery.of(context).size.width*.05),
      height: MediaQuery.of(context).size.height*0.4,
      child: Column(
        children: [
          Text('Update',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
          SizedBox(
            height: MediaQuery.of(context).size.height*.05 ,
          ),
          TextFormField(
            controller: m,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.06 ,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).width * 0.15,
            child: ElevatedButton(
              onPressed: () {
                Update(context);
              },
              child: Text(
                'Update',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.blue),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorApp.primarycolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
        ],
      ),
    );
  }

  void Update(
    BuildContext context,
  ) async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    try {
      showLoading(context);
      var updateresponse =
          await ApiManager.update(name, m.text, authProvider.userid);
      String msg = updateresponse.message!;
      if (msg == 'User information updated successfully') {
        hideLoading(context);
        showsucsses(context, '$name updated successful');
        authProvider.loginResponse.user!.name = updateresponse.user!.name;
        authProvider.loginResponse.user!.address = updateresponse.user!.address;
        authProvider.loginResponse.user!.phonenum1 = updateresponse.user!.phonenum1;
        authProvider.loginResponse.user!.phonenum2 = updateresponse.user!.phonenum2;
        authProvider.notifyListeners();
      } else {
        hideLoading(context);
        showmsg(context, 'some thing went wrong');
      }
    } catch (e) {
      hideLoading(context);
      //showerror(context, e.toString());
      showmsg(context, 'some thing went wrong');
    }
  }
}
