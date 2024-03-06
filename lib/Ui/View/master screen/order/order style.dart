import 'package:flutter/material.dart';
import 'package:loqta/Ui/Utiles/circler%20indecator.dart';
import 'package:loqta/Ui/Utiles/color%20file.dart';
import 'package:loqta/data/api%20manager/Api%20manager.dart';
import 'package:loqta/data/models/DeleteResponse.dart';
import 'package:loqta/data/models/OrdersResponse.dart';

import '../../../View model/auth provider.dart';

class OrderStyle extends StatelessWidget {
   OrderStyle({super.key,required this.ordersResponse ,required this.authProvider});
  OrdersResponse ordersResponse;
   AuthProvider authProvider ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width*.04,
        vertical: MediaQuery.of(context).size.height*.01
      ),
      height: MediaQuery.of(context).size.height*.17,
      decoration: BoxDecoration(
        border: Border.all(color: ColorApp.primarycolor,width: 2),
        borderRadius: BorderRadius.circular(22)
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(ordersResponse.products!.primaryImage!,),
                fit: BoxFit.fill
              )
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width*.03,),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*.55,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ordersResponse.products!.name??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: ColorApp.primarycolor),maxLines: 1),
                          SizedBox(
                            height:MediaQuery.of(context).size.height*.008 ,
                          ),
                          Text(ordersResponse.order!.color??'',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),maxLines: 1),
                          SizedBox(
                            height:MediaQuery.of(context).size.height*.008 ,
                          ),
                          Text(ordersResponse.order!.size??'',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),maxLines: 1),
                        ],
                      ),
                     Spacer(),
                      //SizedBox(width:MediaQuery.of(context).size.width*.3 ),
                     InkWell(
                       onTap: () {
                         deletproduct(context,authProvider);
                       },
                       child: Icon(
                         Icons.delete,
                         size: 35,
                       ),
                     )
                    ],
                  ),
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height*.01 ,
                ),
                Row(
                  children: [
                    Text('Total Price : ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),) ,
                    SizedBox(width: MediaQuery.of(context).size.width*.01),
                    Text('${ordersResponse.order!.price??''} '.substring(0,6),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                    Text('  L.E ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void deletproduct(BuildContext context,AuthProvider authProvider)async {
    try{
      showLoading(context);
      DeleteResponse deleteresponse = await ApiManager.deleteorder(ordersResponse.order!.orderId!);
      if(deleteresponse.message == 'Order deleted successfully'){
        hideLoading(context);
        showsucsses(context, 'Order deleted successfully');
        authProvider.notifyListeners();
      } else{
        hideLoading(context);
        showerror(context, 'some thing went wrong try again later');
      }
    }
    catch(e){
      hideLoading(context);
      showerror(context, e.toString());
    }
  }
}
