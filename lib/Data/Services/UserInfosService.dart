import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http ;
import 'package:flutter_dotenv/flutter_dotenv.dart';



class UserInfosService{
  static Future<Map<String, dynamic>> GetUserInfos() async {

    try {
      final storage = FlutterSecureStorage();
      final cookie = await storage.read(key: 'cookie');
      if (cookie == null) {
        return {};
      }
      var url = Uri.http("192.168.43.185:8000","profile");

      final res = await http.get(
       url,
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

}