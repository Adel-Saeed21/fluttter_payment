class PaymentIntentRequestModel {
  final String amount;
  final String currency;
  final String? customerId;

  PaymentIntentRequestModel({
    required this.amount,
    required this.currency,
    this.customerId,
  });

  Map<String, dynamic> toJson() {
    return {'amount': amount, 'currency': currency, "customer_id": customerId};
  }
}
