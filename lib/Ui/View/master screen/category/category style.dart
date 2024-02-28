import 'package:flutter/material.dart';
import 'package:loqta/Ui/Utiles/color%20file.dart';

class CategoyStyle extends StatelessWidget {
  const CategoyStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02 ) ,
      padding: EdgeInsets.all( MediaQuery.of(context).size.width*.01 ),
      width: MediaQuery.of(context).size.width*.4 ,
      decoration: BoxDecoration(
        color: ColorApp.primarycolor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width*.35 ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('assets/images/testpic.png')
                )
              ),
            ),
          ),
          Text('title ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
          Text('hint text desc  ',style: TextStyle(fontSize: 16)),
          Row(
            children: [
              Text('50 LE  '),
              Spacer(),
             InkWell(
               onTap: () {},
               child: Container(
                 width: MediaQuery.of(context).size.width*.08,
                 height:  MediaQuery.of(context).size.width*.08,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15)
                 ),
                 child: Icon(Icons.add),
               ),
             )
            ],
          )
        ],
      ),
    );
  }
}
