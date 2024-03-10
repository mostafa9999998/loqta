import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';
import 'package:loqta/data/models/DeleteResponse.dart';
import 'package:loqta/data/models/OrderResponse.dart';
import 'package:loqta/data/models/OrdersResponse.dart';
import 'package:loqta/data/models/UpdateBody.dart';
import 'package:loqta/data/models/UpdateResponse.dart';
import '../models/CategoryResponse.dart';
import '../models/LoginBody.dart';
import '../models/LoginResponse.dart';
import '../models/OfferPicResponse.dart';
import '../models/OrderBody.dart';
import '../models/ProductResponse.dart';
import '../models/RegisterBody.dart';
import '../models/RegisterResponse.dart';
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


 static Future<bool> register(String name,String email,String phone1,String phone2,String password,String address) async {
   Uri url = Uri.parse("${baseapi}${hostapi}Sign_up");
   final connectivityResult = await (Connectivity().checkConnectivity());
   if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi ) {
     // I am connected to a mobile network.
     RegisterBody registerBody = RegisterBody(
         email: email,
         name: name,
         password: password,
         phonenum1: phone1,
         phonenum2:phone2 ,
         address: address
     ) ;
     var response = await post(url,body: registerBody.toJson());
     if (response.statusCode >=200 || response.statusCode<300 ){
       var b = RegisterResponse.fromJson(jsonDecode(response.body));
       if (b.message =='User registered successfully'){
         return true;
       }else{return false;}
     }else{return false;}
   } else {
     throw Exception('network failed') ;
   }
 }

 static Future<bool> login(String phone,String password) async {
   Uri url = Uri.parse("${baseapi}${hostapi}login");
   final connectivityResult = await (Connectivity().checkConnectivity());
   if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi ) {
     // I am connected to a mobile network.
     LoginBody loginBody = LoginBody(
       phone: phone,
       password: password,
     ) ;
     var response = await post(url,body: loginBody.toJson());
     if (response.statusCode >=200 || response.statusCode<300 ){
       var b = LoginResponse.fromJson(jsonDecode(response.body));
       if (b.type =='user'){
         return true;
       }else{return false;}
     }else{return false;}
   } else {
     throw Exception('network failed') ;
   }
 }

 static Future<LoginResponse> loginresponse(String phone,String password) async {
   Uri url = Uri.parse("${baseapi}${hostapi}login");
     // I am connected to a mobile network.
     LoginBody loginBody = LoginBody(
       phone: phone,
       password: password,
     ) ;
     var response = await post(url,body: loginBody.toJson());

       var b = LoginResponse.fromJson(jsonDecode(response.body));
       return b ;

     }


 static Future<bool> order(String usersId, String productId, String quantity, String price, String color, String size) async {
   Uri url = Uri.parse("${baseapi}${hostapi}add_order");
   final connectivityResult = await (Connectivity().checkConnectivity());
   if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi ) {
     // I am connected to a mobile network.
     OrderBody orderBody = OrderBody(
         color:color ,
         size: size,
         price: price,
         productId: productId,
         quantity: quantity,
         usersId:usersId
     ) ;
     var response = await post(url,body: orderBody.toJson());
     if (response.statusCode >=200 || response.statusCode<300 ){
       var b = OrderResponse.fromJson(jsonDecode(response.body));
       if (b.message =='Order created successfully'){
         return true;
       }else{return false;}
     }else{return false;}
   } else {
     throw Exception('network failed') ;
   }
 }


 static Future<List<OrdersResponse>> getorderslist(int userid) async{
   try{
     Uri url = Uri.parse("${baseapi}${hostapi}get_order/$userid");
     Response response = await get(url);
     List<dynamic> jsonResponse = jsonDecode(response.body);
     List<OrdersResponse> ordersResponse = jsonResponse.map((json) => OrdersResponse.fromJson(json)).toList();
     return ordersResponse;
   } catch(e){
     throw e ;
   }
 }


 static Future<DeleteResponse> deleteorder(int productid) async{
   try{
     Uri url = Uri.parse("${baseapi}${hostapi}delete_order/$productid");
     Response response = await delete(url);
     Map json   = jsonDecode(response.body);
     DeleteResponse deleteResponse= DeleteResponse.fromJson(json);
     return deleteResponse;
   } catch(e){
     throw e ;
   }
 }


 static Future<List<OfferPicResponse>> getofferlist() async{
   try{
     Uri url = Uri.parse("${baseapi}${hostapi}get_offers");
     Response response = await get(url);
     List<dynamic> jsonResponse = jsonDecode(response.body);
     List<OfferPicResponse> offerPicResponse = jsonResponse.map((json) => OfferPicResponse.fromJson(json)).toList();
     return offerPicResponse;
   } catch(e){
     throw e ;
   }
 }

 static Future<UpdateResponse> update(String attr,String newdata,int userid) async {

   try{
     if (attr =='name' ){
     Uri url = Uri.parse("${baseapi}${hostapi}updateuser/$userid?$attr=$newdata");

     var response = await post(url);

     var b = UpdateResponse.fromJson(jsonDecode(response.body));
     return b ;
     }else  if (attr =='phonenum1' ){
       Uri url = Uri.parse("${baseapi}${hostapi}updateuser/$userid?$attr=$newdata");
       var response = await post(url);

       var b = UpdateResponse.fromJson(jsonDecode(response.body));
       return b ;
     }else  if (attr =='phonenum2' ){
       Uri url = Uri.parse("${baseapi}${hostapi}updateuser/$userid?$attr=$newdata");

       var response = await post(url);

       var b = UpdateResponse.fromJson(jsonDecode(response.body));
       return b ;
     }else {
       Uri url = Uri.parse("${baseapi}${hostapi}updateuser/$userid?$attr=$newdata");
       var response = await post(url);

       var b = UpdateResponse.fromJson(jsonDecode(response.body));
       return b ;
     }
 } catch(e){
     throw e ;
   }


 }

}