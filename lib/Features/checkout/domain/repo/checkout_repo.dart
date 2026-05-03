import 'package:payment/Features/checkout/data/payment_intent_request_model.dart';
import 'package:payment/core/networking/api_result.dart';

abstract class CheckoutRepo {
  Future<ApiResult<void>> makePayment({
    required PaymentIntentRequestModel paymentIntent,
  });
}
