import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http ;


class UserInfosService{
  static Future<Map<String, dynamic>> GetUserInfos() async {

    try {
      final storage = FlutterSecureStorage();
      final cookie = await storage.read(key: 'cookie');
      if (cookie == null) {
        return {};
      }
      final res = await http.get(
        "https://smartbevdb-sil-rhap.onrender.com/profile",
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