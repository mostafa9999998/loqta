import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loqta/Ui/Utiles/circler%20indecator.dart';
import 'package:loqta/data/api%20manager/Api%20manager.dart';
import 'package:loqta/data/models/CategoryResponse.dart';
import 'package:provider/provider.dart';

import '../../../View model/main provider.dart';

class CategoriesStyle extends StatelessWidget {
  CategoriesStyle({super.key,required this.categoryResponse});
  CategoryResponse categoryResponse ;
  @override
  Widget build(BuildContext context) {
    MainProvider provider =Provider.of(context);
    return InkWell(
      onTap: () async {
        provider.currentindex = 1 ;
        showLoading(context);
        provider.products = await ApiManager.getproducts(categoryResponse.id!);
         hideLoading(context);
        provider.notifyListeners();
      },
      child: Container(
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
      ),
    );
  }
}
