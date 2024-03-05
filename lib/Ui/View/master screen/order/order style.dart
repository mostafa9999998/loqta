import 'package:flutter/material.dart';
import 'package:loqta/Ui/Utiles/color%20file.dart';

class OrderStyle extends StatelessWidget {
  const OrderStyle({super.key});

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
                image: AssetImage('assets/images/1_37.png',),
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
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: ColorApp.primarycolor),maxLines: 1),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*.008 ,
                        ),
                        Text('Red',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),maxLines: 1),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*.008 ,
                        ),
                        Text('2xL',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),maxLines: 1),
                      ],
                    ),
                   SizedBox(width:MediaQuery.of(context).size.width*.3 ),
                   InkWell(
                     child: Icon(
                       Icons.delete,
                       size: 35,
                     ),
                   )
                  ],
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height*.01 ,
                ),
                Row(
                  children: [
                    Text('Total Price : ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),) ,
                    SizedBox(width: MediaQuery.of(context).size.width*.01),
                    Text('250000 LE ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
