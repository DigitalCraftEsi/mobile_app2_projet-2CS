import 'package:flutter/foundation.dart';
import 'package:mob2/Data/Services/PaymentService.dart';



class CreditCardsBloc extends ChangeNotifier {
  Map<String,dynamic> _Cards = {};
  Map<String,dynamic> get Cards=> _Cards;
  Map<String,dynamic> _dataAdded = {};
  Map<String,dynamic> get dataAdded => _dataAdded;
  Future<void> AddCreditCard({required String cardNumber, required String holderName, required String expiryMonth, required String expiryYear}) async {
    _dataAdded= await PaymentService.AddCreditCard(cardNumber: cardNumber, holderName: holderName, expiryMonth: expiryMonth, expiryYear: expiryYear);
    notifyListeners();
  }
  Future<void> GetCreditCards() async {
    _Cards= await PaymentService.GetCreditCards();
    notifyListeners();
  }

}