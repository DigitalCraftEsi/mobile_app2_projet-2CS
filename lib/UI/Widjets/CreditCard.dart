
import 'package:flutter/material.dart';
class CreditCard extends StatelessWidget {
  const CreditCard({Key? key, required this.cardNumber, required this.cardHolder, required this.expirationDate}) : super(key: key);
   final String cardNumber;
   final String cardHolder;
   final String expirationDate;
  @override
  Widget build(BuildContext context) {
    var screenWidth=MediaQuery.of(context).size.width;
    var screenHeight=MediaQuery.of(context).size.height;
    return  Container(
      width: screenWidth/1.4,
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color.fromRGBO(1, 113, 75, 0.5), Color.fromRGBO(1, 113, 75, 1)],

        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("lib/UI/assets/Images/Shape.png",width: 40,),
              ],
            ),
            Row(
              children: [
                Container(

                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(1, 113, 75, 1),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  width: 45,
                  height: 35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5),



                    ),
                    child: Image.asset("lib/UI/assets/Images/code.PNG",fit: BoxFit.fill,),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("$cardNumber",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 17),),
              ],
            ),
            SizedBox(height: 14,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cardholder",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 12),),
                    Text("$cardHolder",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 16),),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Exp. Date",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 12),),
                    Text("$expirationDate",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 16),),
                  ],

                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
