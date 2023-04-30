class creditCard{
  final String cardNumber;
  final String expiryMonth;
  final String holderName;
  final String expiryYear;

  creditCard({required this.cardNumber, required this.expiryMonth, required this.holderName, required this.expiryYear});
  factory creditCard.fromJson(Map<String, dynamic> json) {
    return creditCard(
      cardNumber: json['cardNumber'] as String,
      expiryMonth: json['expiryMonth'] as String,
      expiryYear: json['expiryYear'] as String,
      holderName: json['holderName'] as String,
    );
  }
}