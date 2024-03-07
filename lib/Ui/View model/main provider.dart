import 'package:flutter/cupertino.dart';

import '../../data/models/productsListResponse.dart';

class MainProvider extends ChangeNotifier{
  List<ProductsListResponse> products =[];
  int productid = 1;
  int categoryid = 1;
  int currentindex = 0;
  //List<OfferPicResponse> OfferPicResponse

  void setproductid(int id){
   productid = id ;
  }
 int  getproductid (){
    return productid ;
 }

  void setcategoryid(int id){
   categoryid = id ;
  }
 int  getcategoryid (){
    return categoryid ;
 }

  void setcurrentindex(int id){
    currentindex = id ;
  }
  int  getcurrentindex (){
    return currentindex ;
  }
}