import 'dart:convert';

import 'package:flutter_adyen_cse/models/adyen_cse_card.dart';
import 'package:flutter_adyen_cse/models/adyen_cse_encrypted_card.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http ;
import 'dart:developer';

import 'package:flutter_adyen_cse/flutter_adyen_cse.dart';
import 'package:flutter_adyen_cse/models/models.dart';

import 'UserInfosService.dart';


class PaymentService{
  static Future<Map<String, dynamic>> GetCreditCards() async {

    try {
      final storage = FlutterSecureStorage();
      final cookie = await storage.read(key: 'cookie');
      if (cookie == null) {
        return {};
      }
      String? accessToken = UserInfosService.extractAccessTokenFromCookie(cookie);
      var url = Uri.https("smartbevdb-sil-rhap.onrender.com","card");

      final res = await http.get(
       url,
        headers: {'Authorization': 'Bearer $accessToken',},
      );
      final data = json.decode(res.body) as Map<String, dynamic>;
      return data;
    }
    catch (e) {
      print(e.toString());
      return {};
    }
  }
  static Future<Map<String, dynamic>> GetDrinkInfos(int idBoisson) async {

    try {

      var url = Uri.https("smartbevdb-sil-rhap.onrender.com","beverage/$idBoisson");

      final storage = FlutterSecureStorage();
      final cookie = await storage.read(key: 'cookie');

      if (cookie == null) {
        return {};
      }
      String? accessToken = UserInfosService.extractAccessTokenFromCookie(cookie);
      final res = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken',},
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
      String? accessToken = UserInfosService.extractAccessTokenFromCookie(cookie);
      var url = Uri.https("smartbevdb-sil-rhap.onrender.com","machine/$idDistributeur");

      final res = await http.get(
          url,
        headers: {'Authorization': 'Bearer $accessToken',},
      );
      final data = json.decode(res.body) as Map<String, dynamic>;
      return data;
    }
    catch (e) {
      print(e.toString());
      return {};
    }
  }
  static Future<Map<String, dynamic>> addReclamation(
      {required String title, required String descr, required int idCommande}) async {
    try {
      final storage = FlutterSecureStorage();
      final cookie = await storage.read(key: 'cookie');
      if (cookie == null) {
        return {};
      }
      String? accessToken = UserInfosService.extractAccessTokenFromCookie(cookie);
      var url = Uri.https("smartbevdb-sil-rhap.onrender.com","reclamation");
      final res = await http.post(
        url, body: {
        "title"  : "$title",
        "descr"  : "$descr",
        "order" : "$idCommande"
      },
        headers: {'Authorization': 'Bearer $accessToken',},
      );

      final data = json.decode(res.body) as Map<String, dynamic>;
      print(data);
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
      String? accessToken = UserInfosService.extractAccessTokenFromCookie(cookie);
      var url = Uri.https("smartbevdb-sil-rhap.onrender.com","card");

      final res = await http.post(
          url, body: {
        "cardNumber"  : "$cardNumber",
        "holderName"  : "$holderName",
        "expiryMonth" : "$expiryMonth",
        "expiryYear": "$expiryYear",
      },
        headers: {'Authorization': 'Bearer $accessToken',},
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
      Map<String,dynamic> card=temp["card"];
      print(temp);
      await FlutterAdyenCse.initAdyenCse(AdyenCseConfig(
          publicKey: '10001|8D57EDC90DA84EDB6C10B11CA63CD1A918987EAB9C5272FCEA2A4604FB5E9261720CC9EFE7D7B92A863193157EBC425DEE75BBA620FCC3999BBCE7AC8155A05AAF18641D82FE10D3773A68EA660B9601D9CD37A4F1827760637728771EF45C4B201732B532F9169119A1FD714A038D1A9C47A277157C13214E222805423389327C8C8AACA18B8728EC38271DE9BDF8002C253F94060E6241CD6996E70D0238F04A6F0688366F0C60768E121087DA347F2AD6B889E7F7AAFEF0BC13C2712EA4E23D39D4EE83DC016321C37A0C991D7E8D3630C6D98A2785402A4101BAEBF9E01AFE2B7FA675F9A73116318570BF5956EC6EE5AE664C8DA28E85A8EC0FA1434331'
      ));
        final AdyenCseEncryptedCard? encryptedCard =
        await FlutterAdyenCse.encryptCard(AdyenCseCard(
          cardNumber:"${card['cardNumber']}",
          expiryMonth: "${card['expiryMonth']}",
          expiryYear: "${card['expiryYear']}30",
          securityCode:  "${card['cvc']}",
        ));

        if (encryptedCard != null) log(encryptedCard.toJson().toString());
        card.update("cardNumber", (value) => encryptedCard!.encryptedNumber);
      card.update("expiryMonth", (value) => encryptedCard!.encryptedExpiryMonth);
      card.update("cvc", (value) => encryptedCard!.encryptedSecurityCode);
      card.update("expiryYear", (value) => encryptedCard!.encryptedExpiryYear);
        temp.update("card", (value) => card);
      // temp.update("boissons", (value) => [{"idBoisson":2,"Quantite":3}]);
     // card.update("cardNumber", (value) => "")

      final storage = FlutterSecureStorage();
      final cookie = await storage.read(key: 'cookie');
      if (cookie == null) {
        return {};
      }
      String? accessToken = UserInfosService.extractAccessTokenFromCookie(cookie);
      var url = Uri.https("smartbevdb-sil-rhap.onrender.com","order");
      final res = await http.post(
        url,
        headers: {"Content-type": "application/json",'Authorization': 'Bearer $accessToken',},
        body: jsonEncode(temp) ,

      );


      final data = json.decode(res.body) as Map<String, dynamic>;
      print(data);
      return data;
    }
    catch (e) {
      print(e.toString());
      return {};
    }
  }
}