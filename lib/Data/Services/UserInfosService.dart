import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http ;
import 'package:flutter_dotenv/flutter_dotenv.dart';



class UserInfosService{
 static String? extractAccessTokenFromCookie(String cookie) {
    final cookieKeyValuePairs = cookie.split('; ');
    for (var cookiePair in cookieKeyValuePairs) {
      final keyValue = cookiePair.split('=');
      final key = keyValue[0];
      final value = keyValue[1];
      if (key == 'accessToken') {
        return value;
      }
    }
    return null;
  }
  static Future<Map<String, dynamic>> GetUserInfos() async {


    try {
      final storage = FlutterSecureStorage();
      final cookie = await storage.read(key: 'cookie');
      if (cookie == null) {
        return {};
      }
      // Replace with the actual cookie string
      String? accessToken = UserInfosService.extractAccessTokenFromCookie(cookie);
      var url = Uri.https("smartbevdb-sil-rhap.onrender.com","profile");

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

}