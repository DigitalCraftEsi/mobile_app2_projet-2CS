

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mob2/UI/Widjets/CustomNavBar.dart';
import 'package:mob2/UI/Widjets/PaymentRow.dart';
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: CostumNavBar(index:1),
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
                  Text("History",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 22),),
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
                PaymentRow(image: "lib/UI/assets/Images/pay.png", title: "Payment", date: "12.03.2023", amount: "60",istTime: false,),
                PaymentRow(image: "lib/UI/assets/Images/pay.png", title: "Payment", date: "12.03.2023", amount: "60",istTime: false,),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 40,bottom: 5,top: 20),
              child: Text("Yesterday",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17),),
            ),
            Column(
              children: [
                PaymentRow(image: "lib/UI/assets/Images/pay.png", title: "Payment", date: "12.03.2023", amount: "60",istTime: false,),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 40,bottom: 5,top: 20),
              child: Text("Last 7 days",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17),),
            ),
            Column(
              children: [
                PaymentRow(image: "lib/UI/assets/Images/pay.png", title: "Payment", date: "12.03.2023", amount: "60",istTime: false,),
              ],
            ),
          ],
        ),
      ),


    );
  }
}

