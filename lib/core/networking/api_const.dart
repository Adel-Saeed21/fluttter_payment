class ApiConst {
  static const String stripeBaseUrl = 'https://api.stripe.com/v1/';
  static const String paymobBaseUrl = 'https://accept.paymob.com/';

  // Stripe endpoints
  static const String paymentIntent = "payment_intents";
  static const String createStripeCustomer = "customers";
  static const String createEphemeralKeys = "ephemeral_keys";

  // Paymob endpoints
  static const String paymobAuth = "api/auth/tokens";
  static const String paymobCreateIntent = "v1/intention/";
}
/* 
in each payment try we will create epheremal key{Customer_id, stripe version}
payment intent will add customer id to old parameters

customer id -> returned from strip we wiill add field to local storage called customerStripeId
*/