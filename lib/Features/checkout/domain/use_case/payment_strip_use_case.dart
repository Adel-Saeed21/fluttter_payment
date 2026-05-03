import 'package:payment/Features/checkout/data/payment_intent_request_model.dart';
import 'package:payment/Features/checkout/domain/repo/checkout_repo.dart';
import 'package:payment/core/networking/api_result.dart';

class PaymentStripUseCase {
  final CheckoutRepo checkoutRepo;
  PaymentStripUseCase(this.checkoutRepo);
  Future<ApiResult<void>> call({
    required String amount,
    required String currency,
  }) async {
    return await checkoutRepo.makePayment(
      paymentIntent: PaymentIntentRequestModel(
        amount: amount,
        currency: currency,
      ),
    );
  }
}
