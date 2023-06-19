
import 'package:flutter/material.dart';
import 'package:mob2/UI/Widjets/CustomNavBar.dart';
import 'package:mob2/UI/Widjets/PaymentRow.dart';
class MyNotificationScreen extends StatelessWidget {
  const MyNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     bottomNavigationBar: CostumNavBar(index:0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 60,bottom: 10),
              child: Column(
                children: [
                  Image.asset("lib/UI/assets/Images/Logo.png"),
                  SizedBox(height: 5,),
                  Text("My Notifications",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 21),),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 40,bottom: 5,top: 20),
              child: Text("Today",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17),),
            ),
            Column(
              children: [
                PaymentRow(image: "lib/UI/assets/Images/pay.png", title: "Payment Restored", date: "12.03.2023", amount: "10:45",istTime: true,),
                PaymentRow(image: "lib/UI/assets/Images/pay.png", title: "Payment Restored", date: "12.03.2023", amount: "10:45",istTime: true,),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 40,bottom: 5,top: 20),
              child: Text("Yesterday",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17),),
            ),
            Column(
              children: [
                PaymentRow(image: "lib/UI/assets/Images/pay.png", title: "Payment Restored", date: "12.03.2023", amount: "10:45",istTime: true,),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 40,bottom: 5,top: 20),
              child: Text("Last 7 days",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17),),
            ),
            Column(
              children: [
                PaymentRow(image: "lib/UI/assets/Images/pay.png", title: "Payment Restored", date: "12.03.2023", amount: "10:45",istTime: true,),
              ],
            ),
          ],
        ),
      ),


    );
  }
}
