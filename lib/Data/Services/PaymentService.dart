import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http ;


class PaymentService{
  static Future<Map<String, dynamic>> GetCreditCards() async {

    try {
      final storage = FlutterSecureStorage();
      final cookie = await storage.read(key: 'cookie');
      if (cookie == null) {
        return {};
      }
      final res = await http.get(
        "https://smartbevdb-sil-rhap.onrender.com/card",
        headers: {'Cookie': cookie},
      );
      final data = json.decode(res.body) as Map<String, dynamic>;
      return data;
    }
    catch (e) {
      print(e.toString());
      return {};
    }
  }
  static Future<Map<String, dynamic>> GetDistributeurInfos(int idDistributeur) async {

    try {
      final storage = FlutterSecureStorage();
      final cookie = await storage.read(key: 'cookie');
      if (cookie == null) {
        return {};
      }
      final res = await http.get(
          "https://smartbevdb-sil-rhap.onrender.com/machine/$idDistributeur",
        headers: {'Cookie': cookie},
      );
      final data = json.decode(res.body) as Map<String, dynamic>;
      return data;
    }
    catch (e) {
      print(e.toString());
      return {};
    }
  }
  static Future<Map<String, dynamic>> AddCreditCard(
      {required String cardNumber, required String holderName, required String expiryMonth, required String expiryYear}) async {
    try {
      final storage = FlutterSecureStorage();
      final cookie = await storage.read(key: 'cookie');
      if (cookie == null) {
        return {};
      }
      final res = await http.post(
          "https://smartbevdb-sil-rhap.onrender.com/card", body: {
        "cardNumber"  : "$cardNumber",
        "holderName"  : "$holderName",
        "expiryMonth" : "$expiryMonth",
        "expiryYear": "$expiryYear",
      },
        headers: {'Cookie': cookie},
      );

      final data = json.decode(res.body) as Map<String, dynamic>;
      return data;
    }
    catch (e) {
      print(e.toString());
      return {};
    }
  }
  static Future<Map<String, dynamic>> DoPayment(Map<String,dynamic> orderedDrinks) async {
    try {
      //just to avoid cast error
      Map<String,dynamic> temp=orderedDrinks;
      Map<String,String> card=temp["card"];
     // card.update("cardNumber", (value) => "")

      final storage = FlutterSecureStorage();
      final cookie = await storage.read(key: 'cookie');
      if (cookie == null) {
        return {};
      }
      final res = await http.post(
        "https://smartbevdb-sil-rhap.onrender.com/order",
        headers: {"Content-type": "application/json",'Cookie': cookie,},
        body: jsonEncode(temp) ,

      );

      final data = json.decode(res.body) as Map<String, dynamic>;
      return data;
    }
    catch (e) {
      print(e.toString());
      return {};
    }
  }
}