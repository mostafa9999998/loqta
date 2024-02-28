import 'package:flutter/cupertino.dart';
import 'package:loqta/Ui/View/master%20screen/category/category%20style.dart';
import 'package:loqta/Ui/View/master%20screen/home/categoris%20wedget.dart';

class Home extends StatelessWidget {
   Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height*.2,),
            Container(
              height: 200,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return CategoriesStyle() ;
                  },
                itemCount: 0,
              ),
            ),
            /*Container(
              height: 300,

              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return CategoyStyle(mmmmm: mm[index],);
                },
                itemCount: mm.length,
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
