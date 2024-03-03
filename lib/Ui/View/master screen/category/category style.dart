import 'package:flutter/material.dart';
import 'package:loqta/Ui/Utiles/color%20file.dart';
import 'package:loqta/Ui/View%20model/main%20provider.dart';
import 'package:loqta/Ui/View/master%20screen/category/product/product%20screen.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/productsListResponse.dart';

class CategoyStyle extends StatelessWidget {
  CategoyStyle({super.key,required this.productsListResponse});
  ProductsListResponse productsListResponse ;
  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of(context);
    return InkWell(
      onTap: () {
        provider.setproductid(productsListResponse.id!);
        Navigator.pushNamed(context, ProductScreen.ProductScreenname);
      },
      child: Container(
        margin:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02,
        vertical:MediaQuery.of(context).size.width*.02 ) ,
        //padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.03 ),
        width: MediaQuery.of(context).size.width*.4 ,
        height:MediaQuery.of(context).size.width*.6 ,
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*.01,left: MediaQuery.of(context).size.width*.01,
            top: MediaQuery.of(context).size.width*.01),
        decoration: BoxDecoration(
          border: Border.all(color:ColorApp.primarycolor,width: 3 ),
          //color:Color(0x495b658a),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height:MediaQuery.of(context).size.width*.3 ,
              //width: MediaQuery.of(context).size.width*.4 ,
              decoration: BoxDecoration(
                //color: Colors.orange,
                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(productsListResponse.fullSrc??"")
                ),
              ),
            ),
           Container(
             padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.03 ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 SizedBox(height: MediaQuery.of(context).size.height*.01,),
                 Text(productsListResponse.name??"",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                 SizedBox(height: MediaQuery.of(context).size.height*.005,),
                 Text(productsListResponse.description??"",style: TextStyle(fontSize: 16),maxLines: 1),
                 SizedBox(height: MediaQuery.of(context).size.height*.01,),
                 Row(
                   children: [
                     Text('${productsListResponse.price} LE',style: TextStyle(fontWeight: FontWeight.w800)),
                     Spacer(),
                     InkWell(
                       onTap: () {},
                       child: Container(
                         width: MediaQuery.of(context).size.width*.08,
                         height:  MediaQuery.of(context).size.width*.08,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15)
                         ),
                         child: Icon(Icons.add_circle_outline,size: 30),
                       ),
                     ),
                     SizedBox(width:  MediaQuery.of(context).size.width*.01,)
                   ],
                 ),
               ],
             ),
           ),
           /* Text(productsListResponse.name??"",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
            SizedBox(height: MediaQuery.of(context).size.height*.005,),
            Text(productsListResponse.description??"",style: TextStyle(fontSize: 16),maxLines: 1),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Row(
              children: [
                Text('${productsListResponse.price} LE',style: TextStyle(fontWeight: FontWeight.w800)),
                Spacer(),
               InkWell(
                 onTap: () {},
                 child: Container(
                   width: MediaQuery.of(context).size.width*.08,
                   height:  MediaQuery.of(context).size.width*.08,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15)
                   ),
                   child: Icon(Icons.add_circle_outline,size: 30),
                 ),
               ),
                SizedBox(width:  MediaQuery.of(context).size.width*.01,)
              ],
            ),*/
            SizedBox(height: MediaQuery.of(context).size.height*.01,)
          ],
        ),
      ),
    );
  }
}
