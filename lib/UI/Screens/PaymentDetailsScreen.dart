

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mob2/UI/Screens/HomeScreen.dart';
import 'package:mob2/UI/Screens/ReportProblemScreen.dart';
import 'package:mob2/UI/Widjets/CustomNavBar.dart';
import 'package:mob2/UI/Widjets/PaymentDetail.dart';
class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth=MediaQuery.of(context).size.width;
    var screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: CostumNavBar(index: 2,),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 35,bottom: 10),
        child: Column(
          children: [
            Image.asset("lib/UI/assets/Images/Logo.png"),
            SizedBox(height: 5,),
            Text("Payment",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 21),),
          ],
        ),
      ),
      Container(
      width: screenWidth/1.3,
      child: Card(
        color: Color.fromRGBO(240, 240, 240, 1),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
      ),
      elevation: 4,
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset("lib/UI/assets/Images/Logo.png",width: 44,),
                SizedBox(height: 5,),
                Text("SmartBev",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 18),),
                Text("Esi,OuedSmar,Alger",style: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.72)),)
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recieved Account",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(51, 51, 51, 0.6),fontSize: 12),),
                    Text("Credit Card Holder",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(51, 51, 51, 0.6),fontSize: 12),),
                    Text("Card Number",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(51, 51, 51, 0.6),fontSize: 12),),
                    Text("Date",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(51, 51, 51, 0.6),fontSize: 12),),
                    Text("Time",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(51, 51, 51, 0.6),fontSize: 12),),
                    Text("Merchants :",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(51, 51, 51, 0.6),fontSize: 12),),
                    Text("Cappuchino",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(1, 113, 75, 1),fontSize: 12),),
                    Text("Hot Chocolate",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(1, 113, 75, 1),fontSize: 12),),
                    Text("Total",style: TextStyle(fontWeight: FontWeight.w700,color:Color.fromRGBO(14, 14, 14, 1),fontSize: 17),),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text("6348489404",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(14, 14, 14, 1),fontSize: 12),),
                    Text("Jane Doe",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(14, 14, 14, 1),fontSize: 12),),
                    Text("0213425363",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(14, 14, 14, 1),fontSize: 12),),
                    Text("20/03/2023",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(14, 14, 14, 1),fontSize: 12),),
                    Text("10:35",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(14, 14, 14, 1),fontSize: 12),),
                    Text("",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(14, 14, 14, 1),fontSize: 12),),
                    Text("60 DA",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(1, 113, 75, 1),fontSize: 12),),
                    Text("60 DA",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(1, 113, 75, 1),fontSize: 12),),
                    Text("120 DA",style: TextStyle(fontWeight: FontWeight.w700,color: Color.fromRGBO(14, 14, 14, 1),fontSize: 17),),
                  ]

                )
              ],
            ),


          ],
        ),
      ),
      ),
      ),
          SizedBox(height: 20,),
          Center(
            child: SizedBox(
              width: 230,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Color.fromRGBO(1, 113, 75, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text('Home',style: TextStyle(letterSpacing: 0.8,fontWeight: FontWeight.w900,color: Colors.white,fontSize: 16),),
                onPressed: () {

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen()));
                },
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: SizedBox(
              width: 230,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color:Color.fromRGBO(1, 113, 75, 1)),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text('Report Problem',style: TextStyle(letterSpacing: 0.8,fontWeight: FontWeight.w900,color: Color.fromRGBO(1, 113, 75, 1),fontSize: 16),),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => ReportProblemScreen()));

                },
              ),
            ),
          ),
        ],
      ),
        ),
      ),
    );
  }
}
