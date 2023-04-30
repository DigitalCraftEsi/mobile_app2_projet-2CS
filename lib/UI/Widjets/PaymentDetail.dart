
import 'package:flutter/material.dart';
class PaymentDetail extends StatelessWidget {
  const PaymentDetail({Key? key, required this.info, required this.value}) : super(key: key);
   final String info;
   final String value;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$info",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(51, 51, 51, 0.6),fontSize: 12),),
        Text("$value",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(14, 14, 14, 1),fontSize: 12),),
      ],
    );
  }
}
