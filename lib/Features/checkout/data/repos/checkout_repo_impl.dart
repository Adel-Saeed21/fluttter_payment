import 'package:payment/Features/checkout/data/payment_intent_request_model.dart';
import 'package:payment/Features/checkout/domain/repo/checkout_repo.dart';
import 'package:payment/core/Payment/strip/stripe_service.dart';
import 'package:payment/core/networking/api_error_handler.dart';
import 'package:payment/core/networking/api_result.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService;
  CheckoutRepoImpl(this.stripeService);

  @override
  Future<ApiResult<void>> makePayment({
    required PaymentIntentRequestModel paymentIntent,
  }) async {
    try {
      await stripeService.makePayment(
        PaymentIntentRequestModel(
          customerId: paymentIntent.customerId,
          amount: paymentIntent.amount.toString(),
          currency: paymentIntent.currency,
        ),
      );
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.error(ApiErrorHandler.handle(e));
    }
  }
}
