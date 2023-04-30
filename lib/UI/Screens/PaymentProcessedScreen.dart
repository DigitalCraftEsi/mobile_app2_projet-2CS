import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mob2/UI/Screens/HomeScreen.dart';
import 'package:mob2/UI/Widjets/CustomNavBar.dart';



class PaymentProcessedScreen extends StatefulWidget {
  const PaymentProcessedScreen({Key? key}) : super(key: key);

  @override
  _PaymentProcessedScreenState createState() => _PaymentProcessedScreenState();
}

class _PaymentProcessedScreenState extends State<PaymentProcessedScreen> {

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 8),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen())));
    return Scaffold(

      bottomNavigationBar: CostumNavBar(index: 2,),
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
                  Text("Payment",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 22),),
                ],
              ),
            ),
            Image.asset(
              "lib/UI/assets/Images/check.png",
              height: 275,
              width: 300,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "Payment processed",
                style: TextStyle(color: Color.fromARGB(255, 33, 130, 97), fontSize: 25),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20), //apply padding to all four sides
              child: Text(
                'Your drink will be ready in a moment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
              ),
            ),





          ],
        ),
      ),


    );
  }
}

