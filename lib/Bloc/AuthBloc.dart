import 'package:flutter/foundation.dart';
import 'package:mob2/Data/Services/AuthService.dart';


class AuthBloc extends ChangeNotifier {
  Map<String,dynamic> _data = {};

  Map<String,dynamic> get data => _data;
  Future<void> Signin(String email,String password) async {
    _data= await AuthService.Signin(email, password);
    notifyListeners();
  }
  Future<void> Signup( {required String nom, required String prenom, required String telephone, required String email, required String password}) async {
    _data= await AuthService.Signup(nom: nom,prenom: prenom,telephone: telephone,email: email,password: password);
    notifyListeners();
  }
}