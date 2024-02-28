import 'package:flutter/cupertino.dart';
class CategoriesStyle extends StatelessWidget {
  CategoriesStyle({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height:MediaQuery.of(context).size.width*.2 ,
            width: MediaQuery.of(context).size.width*.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(250),
              image: DecorationImage(
                image: AssetImage('assets/images/testpic.png')
              )
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.02,
          ),
          Text(
           'title',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
