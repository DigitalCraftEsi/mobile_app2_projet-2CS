import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';
class ProplemReportedScreen extends StatefulWidget {
  const ProplemReportedScreen({Key? key}) : super(key: key);

  @override
  _ProplemReportedScreenState createState() => _ProplemReportedScreenState();
}

class _ProplemReportedScreenState extends State<ProplemReportedScreen> {


  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 6),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen())));
    return Scaffold(


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
                  Text("Report problem",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 22),),
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
                text: "Problem reported",
                style: TextStyle(color: Color.fromARGB(255, 33, 130, 97), fontSize: 25),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20), //apply padding to all four sides
              child: Text(
                'We will get back to you as soon as possible',
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

