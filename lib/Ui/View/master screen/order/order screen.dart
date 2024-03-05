import 'package:flutter/material.dart';
import 'package:loqta/Ui/View/master%20screen/order/order%20style.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height*.05,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*.1,
                    width: MediaQuery.of(context).size.width*.5,
                    child: Image.asset('assets/images/logotext.png',fit: BoxFit.fill),
                  )
                ]),
            SizedBox(height:MediaQuery.of(context).size.height*.02,),
            OrderStyle(),
            OrderStyle(),
            OrderStyle(),
            OrderStyle(),
            OrderStyle(),
            OrderStyle()
          ],
        ),
      ),
    );
  }
}
