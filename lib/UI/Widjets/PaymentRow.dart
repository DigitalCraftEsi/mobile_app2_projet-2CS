
import 'package:flutter/material.dart';
class PaymentRow extends StatelessWidget {
  const PaymentRow({Key? key, required this.image, required this.title, required this.date, required this.amount, required this.istTime}) : super(key: key);
  final String image;
  final String title;
  final String date;
  final int amount;
  final bool istTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 45),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(right: 18),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1.8,
                  color: Color.fromRGBO(1, 113, 75, 1),
                ),
                borderRadius: BorderRadius.all(Radius.circular(200))
            ),
            alignment: Alignment.center,
            child: Image.asset("$image",width: 35,height: 35,fit: BoxFit.contain,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5,),
              Text("$title",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13),),
              SizedBox(height: 3,),
              Text("$date",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 11,color: Color.fromRGBO(51, 51, 51, 0.72)),),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text("- $amount DA",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),),
            ),
          ),
        ],
      ),
    );
  }
}
