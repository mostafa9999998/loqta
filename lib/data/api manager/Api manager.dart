import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';

import '../models/CategoryResponse.dart';
import '../models/ProductResponse.dart';
import '../models/SearchBody.dart';
import '../models/productsListResponse.dart';

class ApiManager{
 static String baseapi = 'https://';
 static String hostapi = 'mo-ecommerce.hwnix.com/api/';


 static Future<List<CategoryResponse>> getcategory ()async{
   Uri url = Uri.parse("${baseapi}${hostapi}get_category");
   Response response = await get(url);
   List<dynamic> jsonResponse = jsonDecode(response.body);
   List<CategoryResponse> categoryResponse = jsonResponse.map((json) => CategoryResponse.fromJson(json)).toList();
   return categoryResponse ;
 }

 static Future<List<ProductsListResponse>> getproducts (int categoryid)async{
   Uri url = Uri.parse("${baseapi}${hostapi}get_products/$categoryid");
   Response response = await get(url);
   List<dynamic> jsonResponse = jsonDecode(response.body);
   List<ProductsListResponse> productsListResponse = jsonResponse.map((json) => ProductsListResponse.fromJson(json)).toList();
   return productsListResponse ;
 }

 static Future<ProductResponse> getproduct(int productid) async{
   try{
     Uri url = Uri.parse("${baseapi}${hostapi}get_product/$productid");
     Response response = await get(url);
     print(response.body[0]);
     Map json   = jsonDecode(response.body);
     ProductResponse productResponse= ProductResponse.fromJson(json);
     return productResponse;
   } catch(e){
     throw e ;
   }
 }

 static Future<List<ProductsListResponse>> search( String name) async {
   Uri url = Uri.parse("${baseapi}${hostapi}search");
   final connectivityResult = await (Connectivity().checkConnectivity());
   if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi ) {
     // I am connected to a mobile network.
     SearchBody searchBody = SearchBody(name : name ) ;
     var response = await post(url,body: searchBody.toJson());
       List<dynamic> jsonResponse = jsonDecode(response.body);
       List<ProductsListResponse> productsListResponse = jsonResponse.map((json) => ProductsListResponse.fromJson(json)).toList();
       return productsListResponse ;
   } else {
     throw Exception('network failed') ;
   }
 }


}

/*
 static Future<List<IssusesNameResponse>> getissuesname ()async{
   Uri url = Uri.parse("https://gradhub.hwnix.com/api/get_issues");
   Response response = await get(url);
   List<dynamic> jsonResponse = jsonDecode(response.body);
   List<IssusesNameResponse> issusesNameResponse = jsonResponse.map((json) => IssusesNameResponse.fromJson(json)).toList();
   return issusesNameResponse ;
 }

  static Future<BabygrothResponse> getcategorydesc(int month ,String categ) async{
   try{
     Uri url = Uri.parse("https://gradhub.hwnix.com/api/get_${categ}_${month}");
     Response response = await get(url);
      print(response.body[0]);
     Map json   = jsonDecode(response.body);
     BabygrothResponse babygrothResponse= BabygrothResponse.fromJson(json);
     return babygrothResponse;

   } catch(e){
     throw e ;
   }
  }

  static Future<bool> addtask( String title,String content,String userId,DateTime dueDate) async {
   Uri url = Uri.parse("https://gradhub.hwnix.com/api/addList");
   final connectivityResult = await (Connectivity().checkConnectivity());
   if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi ) {
     // I am connected to a mobile network.
     TaskBody taskBody = TaskBody(content:content ,dueDate:dueDate ,title:title ,userId:userId ) ;
     var response = await post(url,body: taskBody.toJson());
     if (response.statusCode >=200 || response.statusCode<300 ){
       var b = AddtaskResponse.fromJson(jsonDecode(response.body));
       print(b.result);
       if (b.result =='Data has been saved'){
         print(b.result);
         return true;
       }else{ return false;}
     }else{
       return false;}
   } else {
     throw Exception('network failed') ;
   }
 }
 */