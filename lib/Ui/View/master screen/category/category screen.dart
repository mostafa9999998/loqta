import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loqta/Ui/Utiles/circler%20indecator.dart';
import 'package:loqta/Ui/Utiles/color%20file.dart';
import 'package:loqta/Ui/View%20model/main%20provider.dart';
import 'package:loqta/Ui/View/master%20screen/category/category%20style.dart';
import 'package:loqta/data/api%20manager/Api%20manager.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({super.key});
  TextEditingController? searchtext = TextEditingController() ;
   GlobalKey<FormState> formkey = GlobalKey();

   @override
  Widget build(BuildContext context) {
    MainProvider provider =Provider.of(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height*.02,),
           /* Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width:MediaQuery.of(context).size.width*.05 ,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*.05,
                    width: MediaQuery.of(context).size.width*.3,
                    child: Image.asset('assets/images/logotext.png',fit: BoxFit.fill),
                  )
                ]),*/
            Form(
              key: formkey,
              child: Column(
                children: [
                 // SizedBox(height:MediaQuery.of(context).size.height*.02,),
                  Row(
                    children: [
                      SizedBox(width:MediaQuery.of(context).size.width*.01 ,),
                      Container(
                        width: MediaQuery.of(context).size.width*.7,
                        height: MediaQuery.of(context).size.height*.08,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: '  What do you search for',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            prefixIcon: Icon(Icons.search,color:ColorApp.primarycolor ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.trim().isEmpty ){
                              return "this field can't be empty ";
                            }
                          },
                          controller:searchtext ,
                        ),
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width*.03 ,),
                      ElevatedButton(
                          onPressed:() {
                       search(searchtext!.text,context,provider);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:ColorApp.primarycolor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Text('Search',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),))
                    ],
                  ),
                  // SizedBox(height:MediaQuery.of(context).size.height*.04,),
                  Container(
                    height:  MediaQuery.of(context).size.height*.728,
                    child: GridView.builder(

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .77
                      ),
                      itemBuilder: (context, index) {
                        return CategoyStyle(productsListResponse: provider.products[index],);
                      },
                      itemCount: provider.products.length,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void search(String ss,BuildContext context,MainProvider provider) async{
    if(formkey.currentState!.validate()){
    showLoading(context);
   provider.products = await ApiManager.search(ss);
   hideLoading(context);
   if (provider.products.isEmpty){
     showmsg(context, 'that product not found');
   }
   provider.notifyListeners();
  }
   }
}
/*FutureBuilder(future: ApiManager.getproducts(provider.categoryid),
        builder:(context, snapshot) {
      if (snapshot.hasData){
        return Container(
          child: Column(
            children: [
              SizedBox(height:MediaQuery.of(context).size.height*.05,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:MediaQuery.of(context).size.width*.05 ,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*.05,
                      width: MediaQuery.of(context).size.width*.3,
                      child: Image.asset('assets/images/logotext.png',fit: BoxFit.fill),
                    )
                  ]),
              Form(
                child: Column(
                  children: [
                    SizedBox(height:MediaQuery.of(context).size.height*.02,),
                    Row(
                      children: [
                        SizedBox(width:MediaQuery.of(context).size.width*.01 ,),
                        Container(
                          width: MediaQuery.of(context).size.width*.7,
                          height: MediaQuery.of(context).size.height*.05,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '  What do you search for',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              prefixIcon: Icon(Icons.search,color:ColorApp.primarycolor ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.trim().isEmpty ){
                                return "this field can't be empty ";
                              }
                            },
                            controller:searchtext ,
                          ),
                        ),
                        SizedBox(width:MediaQuery.of(context).size.width*.03 ,),
                        ElevatedButton(
                            onPressed:() {
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:ColorApp.primarycolor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: Text('Search',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),))
                      ],
                    ),
                    // SizedBox(height:MediaQuery.of(context).size.height*.04,),
                    Container(
                      height:  MediaQuery.of(context).size.height*.706,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .79
                        ),
                        itemBuilder: (context, index) {
                          return CategoyStyle(productsListResponse: snapshot.data![index],);
                        },
                        itemCount: snapshot.data!.length,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }else if (snapshot.hasError){
        return Text(snapshot.error.toString());
      }
      else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
        }, )*/