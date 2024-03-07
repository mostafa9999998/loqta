import 'package:flutter/material.dart';

class TextProfileStyle extends StatelessWidget {
   TextProfileStyle({super.key,required this.title,required this.lable});
   String title;
   String lable ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:  MediaQuery.of(context).size.width*.9,
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.05,vertical: MediaQuery.of(context).size.height*.02 ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          Container(
            height: MediaQuery.of(context).size.height*.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.cyan,
            ),
            child: Row(
              children: [
                SizedBox(
                  width:  MediaQuery.of(context).size.width*.05,
                ),
                Text(lable),
                Spacer(),
                InkWell(
                  onTap:() =>  update(),
                  child: Icon(Icons.edit),),
                SizedBox(width:  MediaQuery.of(context).size.width*.03,)
              ],
            ),
          ),
        ],
      ) ,
    );
  }

  update() {

  }
}

/*TextFormField(
        decoration: InputDecoration(
          label: Text('lable'),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)
          ),
          disabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)
          ) ,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)
          ),
          suffixIcon:
        ),
      )*/