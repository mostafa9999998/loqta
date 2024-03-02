import 'package:flutter/cupertino.dart';
import 'package:loqta/data/models/CategoryResponse.dart';

class CategoriesStyle extends StatelessWidget {
  CategoriesStyle({super.key,required this.categoryResponse});
  CategoryResponse categoryResponse ;
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
                image: NetworkImage(categoryResponse.fullSrc??'',),
                fit: BoxFit.fill
              )
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.002,
          ),
          Text(
           categoryResponse.name??'',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
