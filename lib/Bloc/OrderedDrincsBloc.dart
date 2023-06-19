


import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mob2/Data/Models/CreditCard.dart';
import 'package:mob2/Data/Services/PaymentService.dart';
import 'package:mob2/UI/Widjets/CreditCard.dart';

class OrderedDrinksBloc extends ChangeNotifier {
  String cardHolder="";
  String cardNumber="";
  Map<String,dynamic> _orderedDrinks = {};
  Map<String,dynamic> _reclamationData = {};
  Map<String,dynamic> _paymentData = {};
  int total=0;
  Map<String,dynamic> get paymentData => _paymentData;
  Map<String,dynamic> get reclamationData => _reclamationData;
  Map<String,dynamic> get orderedDrinks => _orderedDrinks;

  Future<void> addReclamation({required String title, required String descr,  required int idCommande}) async {
    _reclamationData= await PaymentService.addReclamation(title: title, descr: descr, idCommande: idCommande);
    notifyListeners();
  }
  void DecodeData(String? QrData){
    _orderedDrinks=json.decode(QrData!);
    _orderedDrinks.remove("total");
    notifyListeners();
  }
  void PutCardToPaymentData(creditCard card){
    Map<String,dynamic>_cardmap={};
    _cardmap.putIfAbsent('cardNumber', () =>card.cardNumber );
    cardNumber=card.cardNumber;
    _cardmap.putIfAbsent('holderName', () =>card.holderName );
    cardHolder=card.holderName;
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