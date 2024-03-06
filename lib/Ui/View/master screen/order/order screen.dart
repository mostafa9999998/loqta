import 'package:flutter/material.dart';
import 'package:loqta/Ui/View%20model/auth%20provider.dart';
import 'package:loqta/Ui/View/master%20screen/order/order%20style.dart';
import 'package:loqta/data/api%20manager/Api%20manager.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return FutureBuilder(
      future: ApiManager.getorderslist(authProvider.userid),
      builder: (context, snapshot) {
        if (snapshot.hasData){
         return Container(
           //height: 600,
           child: Column(
             children: [
               SizedBox(height:MediaQuery.of(context).size.height*.05,),
               Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       height: MediaQuery.of(context).size.height*.1,
                       width: MediaQuery.of(context).size.width*.5,
                       child: Image.asset('assets/images/logotext.png',fit: BoxFit.fill),
                     )
                   ]),
               SizedBox(height:MediaQuery.of(context).size.height*.02,),
               Expanded(
                 child: ListView.builder(itemBuilder: (context, index) {
                   return OrderStyle(ordersResponse: snapshot.data![index],authProvider: authProvider,);
                 },
                   itemCount:snapshot.data!.length ,
                 ),
               )

             ],
           ),
         );
        } else if (snapshot.hasError){
          return Text(snapshot.error.toString());
        }else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
