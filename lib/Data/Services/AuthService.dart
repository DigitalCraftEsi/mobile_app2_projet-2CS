import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http ;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {

  static Future<Map<String, dynamic>> Signin(String email,
      String password) async {
    try {
      await dotenv.load(fileName: ".env");
      var url = Uri.http("192.168.43.185:8000","loginConsumer");
      final res = await http.post(
        url, body: {
        "email": "$email",
        "password": "$password"
      },
      );
      if (res.statusCode == 200) {
        // Get the cookie from the response headers
        final cookie = res.headers['set-cookie'];
        if (cookie != null) {
          final storage = FlutterSecureStorage();
          await storage.write(key: 'cookie', value: cookie);
          print(cookie);
        }

        }
      final data = json.decode(res.body) as Map<String, dynamic>;
      return data;
    }
    catch (e) {
      print(e.toString());
      return {};
    }
  }

  static Future<Map<String, dynamic>> Signup(
      {required String nom, required String prenom, required String telephone, required String email, required String password}) async {
    try {
      var url = Uri.http("192.168.43.185:8000","signupconsumer");
      final res = await http.post(
          url, body: {
        "nom"  : "$nom",
        "prenom"  : "$prenom",
        "telephone" : "$telephone",
        "email": "$email",
        "password": "$password"
      }
      );
      if (res.statusCode == 200) {
        // Get the cookie from the response headers
        final cookie = res.headers['set-cookie'];
        if (cookie != null) {
          final storage = FlutterSecureStorage();
          await storage.write(key: 'cookie', value: cookie);
          print(cookie);
        }

      }
      final data = json.decode(res.body) as Map<String, dynamic>;
      return data;
    }
    catch (e) {
      print(e.toString());
      return {};
    }
  }

}