import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loqta/Ui/Utiles/color%20file.dart';
import 'package:loqta/Ui/View/master%20screen/category/category%20style.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({super.key});
  TextEditingController? searchtext ;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
            SizedBox(
              width:MediaQuery.of(context).size.width*.05 ,
            ),
            Container(
              height: MediaQuery.of(context).size.height*.08,
              width: MediaQuery.of(context).size.width*.3,
              child: Image.asset('assets/images/logotext.png',fit: BoxFit.fill),
            )
          ]),
          SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*.7,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: '  What do you search for',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: Icon(Icons.search),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.trim().isEmpty ){
                              return "this field can't be empty ";
                            }
                          },
                          controller:searchtext ,
                        ),
                      ),
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
                  SizedBox(height:MediaQuery.of(context).size.height*.1,),
                  CategoyStyle(),
                  /*GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return CategoyStyle();
                      },
                  itemCount: 5,
                  )*/
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
