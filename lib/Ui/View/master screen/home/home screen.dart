import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:loqta/Ui/Utiles/color%20file.dart';
import 'package:loqta/Ui/View/master%20screen/home/categoris%20wedget.dart';
import 'package:loqta/data/api%20manager/Api%20manager.dart';
import 'package:provider/provider.dart';

import '../../../Utiles/circler indecator.dart';
import '../../../View model/main provider.dart';

class Home extends StatelessWidget {
   Home({super.key});
   List<Image> imagelist = [
     Image.asset(
       'assets/images/testpic.png',
       fit: BoxFit.cover,

     ),
     Image.asset(
       'assets/images/testpic.png',
       fit: BoxFit.cover,
     ),
     Image.asset(
       'assets/images/testpic.png',
       fit: BoxFit.cover,
     ),
   ];
   int currentpage = 1;
  @override
  Widget build(BuildContext context) {
    MainProvider provider =Provider.of(context);
    return Container(
      child: Column(
        children: [
          SizedBox(height:MediaQuery.of(context).size.height*.02,),
        /*  Row(
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
          SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  //SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  FutureBuilder(
                    future: ApiManager.getofferlist(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData){
                       List<int?>  caregoryid = snapshot.data!.map((e) => e.categoryId).toList();
                       List<String?>  imagelist = snapshot.data!.map((e) => e.fullSrc).toList();
                        List<Image> image = imagelist.map((image) => Image.network(image??'',fit: BoxFit.fill,) ).toList();
                        print(imagelist);
                        return InkWell(
                          onTap: () async {
                            provider.currentindex = 1 ;
                            showLoading(context);
                            provider.products = await ApiManager.getproducts(caregoryid[currentpage]??3);
                            hideLoading(context);
                            provider.notifyListeners();
                          },
                          child: ImageSlideshow(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.width*.5,
                                initialPage: 0,
                                indicatorColor: ColorApp.primarycolor,
                                indicatorBackgroundColor: Colors.white,
                                indicatorPadding: 10,
                                children: image ,
                                /// Called whenever the page in the center of the viewport changes.
                                onPageChanged: (value) {
                                  print('Page changed: $value');
                                  currentpage = value + 1  ;
                                },
                                autoPlayInterval: 3000,
                                isLoop: true,
                                disableUserScrolling:true,
                              ),
                        ) ;
                      }else if (snapshot.hasError){
                        return Text(snapshot.error.toString());
                      }else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height*.04,),
                  FutureBuilder(
                    future: ApiManager.getcategory(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData){
                        return Container(
                          height: MediaQuery.of(context).size.height*.4,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              return CategoriesStyle(categoryResponse: snapshot.data![index],);
                            },
                            itemCount: snapshot.data!.length,
                          ),
                        ) ;
                      }else if (snapshot.hasError){
                        return Text(snapshot.error.toString());
                      }else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                    /*child: ,*/
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ) ;
  }
}

/*FutureBuilder(
        future: ApiManager.getcategory(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
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
                  SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*.03,),
                          ImageSlideshow(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.width*.55,
                            initialPage: 0,
                            indicatorColor: ColorApp.primarycolor,
                            indicatorBackgroundColor: Colors.white,
                            indicatorPadding: 10,
                            children: imagelist,
                            /// Called whenever the page in the center of the viewport changes.
                            onPageChanged: (value) {
                              print('Page changed: $value');
                            },
                            autoPlayInterval: 3000,
                            isLoop: true,
                            disableUserScrolling:true,
                          ),
                          SizedBox(height:MediaQuery.of(context).size.height*.04,),
                          Container(
                            height: MediaQuery.of(context).size.height*.4,
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return CategoriesStyle(categoryResponse: snapshot.data![index],);
                              },
                              itemCount: snapshot.data!.length,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          else if (snapshot.hasError){
            return Text(snapshot.error.toString());
          }else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
    )*/