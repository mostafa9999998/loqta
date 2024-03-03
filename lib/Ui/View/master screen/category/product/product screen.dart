import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:loqta/Ui/Utiles/color%20file.dart';
import 'package:loqta/Ui/View/master%20screen/category/product/indecator.dart';
import 'package:loqta/data/api%20manager/Api%20manager.dart';
import 'package:provider/provider.dart';

import '../../../../View model/main provider.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    super.key,
  });
  static String ProductScreenname = 'ProductScreen';
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _currentIndex = 0;
  String? selectedcolor;
  String? selectedSize;
  late double productprice;
  int countity =1;

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of(context);
    return Scaffold(
      body: FutureBuilder(
        future: ApiManager.getproduct(provider.productid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            productprice =   double.parse(snapshot.data!.price!)*countity;
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .03,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back,
                        size: 35, color: ColorApp.primarycolor),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .2,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.width * .3,
                    child: Image.asset('assets/images/logotext.png',
                        fit: BoxFit.fill),
                  )
                ]),
                Container(
                  height: MediaQuery.of(context).size.height * .89,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        CarouselSlider.builder(
                          itemCount: snapshot.data!.fullSrc2!.length,
                          itemBuilder: (context, index, realIndex) {
                            return Image.network(
                              snapshot.data!.fullSrc2![index],
                              fit: BoxFit.cover,
                            );
                          },
                          options: CarouselOptions(
                              height: MediaQuery.of(context).size.height * 0.3,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: false,
                              autoPlayInterval: Duration(seconds: 4),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              viewportFraction: .9,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              }),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            snapshot.data!.fullSrc2!.length,
                            (index) => Indicator(
                              isActive: index == _currentIndex,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .05,
                            right: MediaQuery.of(context).size.width * .05,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .05,
                                ),
                                Row(
                                  children: [
                                    Text(snapshot.data!.name??'',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22)),
                                    Spacer(),
                                    Text('${productprice} \$',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22)),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .05,
                                ),
                                Row(
                                  children: [
                                    Text('sold 500',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22)),
                                    Spacer(),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .25,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorApp.primarycolor,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (countity >1){
                                              countity--;
                                              provider.notifyListeners();
                                              }
                                            },
                                            child: Icon(Icons.remove,
                                                color: ColorApp.primarycolor),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .04),
                                          Text('$countity'),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .04,
                                          ),
                                          InkWell(
                                            onTap: () {

                                                countity++;
                                              provider.notifyListeners();
                                            },
                                            child: Icon(Icons.add,
                                                color: ColorApp.primarycolor),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .05,
                                ),
                                Text(
                                  'Description',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                // SizedBox(height: MediaQuery.of(context).size.height*.01,),
                                Text(snapshot.data!.description??'',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .05,
                                ),
                                Text('color'),
                                Padding(
                                  padding: const EdgeInsets.only(right: 120.0),
                                  child: DropdownButtonFormField2<String>(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      // Add Horizontal padding using menuItemStyleData.padding so it matches
                                      // the menu padding when button's width is not specified.
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      // Add more decoration..
                                    ),
                                    hint: const Text(
                                      'Select Your Color',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    items: snapshot.data!.color!
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select color.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      setState(() {
                                        selectedcolor = value.toString();
                                      });
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        selectedcolor = value.toString();
                                      });
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      padding: EdgeInsets.only(right: 8),
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black45,
                                      ),
                                      iconSize: 24,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .05,
                                ),
                                Text('size'),
                                Padding(
                                  padding: const EdgeInsets.only(right: 120),
                                  child: DropdownButtonFormField2<String>(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      // Add Horizontal padding using menuItemStyleData.padding so it matches
                                      // the menu padding when button's width is not specified.
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      // Add more decoration..
                                    ),
                                    hint: const Text(
                                      'Select Your Size',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    items: snapshot.data!.size!
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select size.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      setState(() {
                                        selectedSize = value.toString();
                                      });
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        selectedSize = value.toString();
                                      });
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      padding: EdgeInsets.only(right: 8),
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black45,
                                      ),
                                      iconSize: 24,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .05,
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.15,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Submit order',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26,
                                          color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorApp.primarycolor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .08,
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

        },
      )
      ,
    );
  }

  void makeorder() {}
}
