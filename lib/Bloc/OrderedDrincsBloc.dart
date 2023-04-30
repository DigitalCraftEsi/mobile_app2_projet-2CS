


import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mob2/Data/Models/CreditCard.dart';
import 'package:mob2/Data/Services/PaymentService.dart';
import 'package:mob2/UI/Widjets/CreditCard.dart';

class OrderedDrinksBloc extends ChangeNotifier {
  Map<String,dynamic> _orderedDrinks = {};
  Map<String,dynamic> _paymentData = {};
  int total=0;
  Map<String,dynamic> get paymentData => _paymentData;
  Map<String,dynamic> get orderedDrinks => _orderedDrinks;

  void DecodeData(String? QrData){
    _orderedDrinks=json.decode(QrData!);
    _orderedDrinks.remove("total");
    notifyListeners();
  }
  void PutCardToPaymentData(creditCard card){
    Map<String,dynamic>_cardmap={};
    _cardmap.putIfAbsent('cardNumber', () =>card.cardNumber );
    _cardmap.putIfAbsent('holderName', () =>card.holderName );
    _cardmap.putIfAbsent('expiryMonth', () =>card.expiryMonth );
    _cardmap.putIfAbsent('expiryYear', () =>card.expiryYear );
    _orderedDrinks.remove('card');
    _orderedDrinks.putIfAbsent('card', () =>_cardmap );
    notifyListeners();
  }
  void PutCvcToPaymentData(String cvc){
    Map<String,dynamic> _cardmap={};
    _cardmap=_orderedDrinks['card'];
    _cardmap.remove('cvc');
    _cardmap.putIfAbsent('cvc', () => cvc );
    _orderedDrinks.remove('card');
    _orderedDrinks.putIfAbsent('card', () =>_cardmap );
    notifyListeners();
  }
  Future<void> DoPayment(Map<String,dynamic> data) async {
    _paymentData= await PaymentService.DoPayment(data);
    notifyListeners();
  }
  Future<void> CalculateTotalPrice(List<Map<String,int>> data) async {
    print("lenth ${data.length}");
    int temp_total=0;
    for(int i=0;i<data.length;i++) {
      Map<String,dynamic> Data= await PaymentService.GetDrinkInfos(data[i]["idBoisson"]!);
      print(Data);
      print("i $i");
      int tarif = int.tryParse(Data["data"]["tarif"].toString()) ?? 0;
      print("tarif ${Data["data"]["tarif"]}");
      int quantite = int.tryParse(Data["data"]["Quantite"].toString()) ?? 0;
      temp_total += tarif * quantite;
    }
    total=temp_total;
    notifyListeners();
  }


}