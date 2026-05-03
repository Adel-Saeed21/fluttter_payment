class ApiConst {
  static const String stripBaseUrl = 'https://api.stripe.com/v1/';
  static const String paymentIntent = "payment_intents";
  static const String createStripCustomer = "customers";
  static const String createEpheremalKeys = "epheremal_keys";
}
/* 
in each payment try we will create epheremal key{Customer_id, stripe version}
payment intent will add customer id to old parameters

customer id -> returned from strip we wiill add field to local storage called customerStripeId
*/