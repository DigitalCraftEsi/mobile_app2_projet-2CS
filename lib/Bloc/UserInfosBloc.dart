import 'package:flutter/foundation.dart';
import 'package:mob2/Data/Services/UserInfosService.dart';



class UserInfosBloc extends ChangeNotifier {
  Map<String,dynamic> _data = {};

  Map<String,dynamic> get data => _data;
  Future<void> getUserInfos() async {
    _data= await UserInfosService.GetUserInfos();
    notifyListeners();
  }
}