import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mob2/Bloc/OrderedDrincsBloc.dart';
import 'package:mob2/UI/Screens/PaymentProcessedScreen.dart';
import 'package:mob2/UI/Screens/ScanQrCodeScreen.dart';
import 'package:mob2/UI/Widjets/CustomNavBar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class WaitingScreen extends StatefulWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
 bool isloading=false;
@override
  void initState() {
    // TODO: implement initState
  Map<String,dynamic> orderedDrinks=Provider.of<OrderedDrinksBloc>(context,listen: false).orderedDrinks;
  Provider.of<OrderedDrinksBloc>(context,listen: false).DoPayment(orderedDrinks).then((value){
    setState(() {
      isloading=false;
    }
    );
    Map<String,dynamic>  PaymentData=Provider.of<OrderedDrinksBloc>(context,listen: false).paymentData;
    print("hh");
    print(PaymentData);
    if(PaymentData["statusCode"]!=200 ){
      print("h");
      print(PaymentData);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("${PaymentData["message"]}"),
            actions: <Widget>[
              ElevatedButton(
                child:  Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ScanQrCodeScreen()),
                  );
                },

              )
            ],
          );
        },
      );
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PaymentProcessedScreen()),
      );
    }
  });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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
            SizedBox(height: 150,),
            CircularProgressIndicator(color: Color.fromRGBO(1, 113, 75, 1),),
            SizedBox(height: 30,),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "Laoding...",
                style: TextStyle(color: Color.fromARGB(255, 33, 130, 97), fontSize: 25),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(13), //apply padding to all four sides
              child: Text(
                'Your payment is being processed',
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

