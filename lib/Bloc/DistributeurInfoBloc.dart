


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mob2/Data/Services/PaymentService.dart';

class DistributeurinfoBloc extends ChangeNotifier {
  Map<String,dynamic> _data = {};

  Map<String,dynamic> get data => _data;

  Future<void> GetDistributeurInfos(int idDistributeur) async {
    _data= await PaymentService.GetDistributeurInfos(idDistributeur);
    notifyListeners();
  }


}