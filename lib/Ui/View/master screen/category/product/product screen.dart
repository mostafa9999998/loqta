import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:loqta/Ui/Utiles/color%20file.dart';

class ProductScreen extends StatefulWidget {
   ProductScreen({super.key});
   static String ProductScreenname ='ProductScreen';
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

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
  final List<String> colorItems = [
    'red',
    'yellow',
    'green',
    'blue'
  ];
  String? selectedcolor;

  final List<String> sizeItems = [
    'M',
    'L',
    'Xl',
    'XXl'
  ];
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SizedBox(height:MediaQuery.of(context).size.height*.05,),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width:MediaQuery.of(context).size.width*.03 ,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back,size: 35,color: ColorApp.primarycolor),
                ),
                SizedBox(
                  width:MediaQuery.of(context).size.width*.2 ,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*.05,
                  width: MediaQuery.of(context).size.width*.3,
                  child: Image.asset('assets/images/logotext.png',fit: BoxFit.fill),
                )
              ]),
          Container(
            height: MediaQuery.of(context).size.height*.9,
            margin: EdgeInsets.only(left:  MediaQuery.of(context).size.width*.05,right: MediaQuery.of(context).size.width*.05,),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  ImageSlideshow(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width*.6,
                  initialPage: 0,
                  indicatorColor: ColorApp.primarycolor,
                  indicatorBackgroundColor: Colors.white,
                indicatorPadding: 10,
                children: imagelist,
                  /// Called whenever the page in the center of the viewport changes.
                onPageChanged: (value) {
                  print('Page changed: $value');
                },
                autoPlayInterval: 5000,
                isLoop: false,
              ),
                  SizedBox(height: MediaQuery.of(context).size.height*.05,),
                  Row(
                    children: [
                      Text('title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                      Spacer(),
                      Text('50 \$',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.05,),
                  Row(
                    children: [
                      Text('sold 500',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:ColorApp.primarycolor,
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              child: Icon(Icons.add),
                            ),
                            Text('1'),
                            InkWell(
                              child: Icon(Icons.remove),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.05,),
                  Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                 // SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Text('''mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm1111111111111111111111111122222222222222222.444444444444444444444444444
                  444444444444444555555555555555555
                  ..............''',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                  SizedBox(height: MediaQuery.of(context).size.height*.05,),
                  Text('color'),
                  Padding(
                    padding: const EdgeInsets.only(right: 120.0),
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                        // the menu padding when button's width is not specified.
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // Add more decoration..
                      ),
                      hint: const Text(
                        'Select Your Color',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: colorItems
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
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.05,),
                  Text('size'),
                  Padding(
                    padding: const EdgeInsets.only( right:  120),
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                        // the menu padding when button's width is not specified.
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // Add more decoration..
                      ),
                      hint: const Text(
                        'Select Your Size',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: sizeItems
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
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.05,),
                  Container(
                    width: MediaQuery.sizeOf(context).width*0.9,
                    height:MediaQuery.sizeOf(context).width*0.15 ,
                    child: ElevatedButton(onPressed: (){
                    },
                      child: Text('Submit order',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:ColorApp.primarycolor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.08,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void makeorder() {}
}
