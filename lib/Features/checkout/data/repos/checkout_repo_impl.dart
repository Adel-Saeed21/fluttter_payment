import 'package:payment/Features/checkout/data/payment_intent_request_model.dart';
import 'package:payment/Features/checkout/domain/repo/checkout_repo.dart';
import 'package:payment/core/Payment/paymob/models/billing_data_model.dart';
import 'package:payment/core/Payment/paymob/models/create_intent_request_model.dart';
import 'package:payment/core/Payment/paymob/models/item_model.dart';
import 'package:payment/core/Payment/paymob/paymob_config.dart';
import 'package:payment/core/Payment/paymob/paymob_service.dart';
import 'package:payment/core/Payment/strip/stripe_service.dart';
import 'package:payment/core/networking/api_error_handler.dart';
import 'package:payment/core/networking/api_result.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService;
  final PaymobService paymobService;
  CheckoutRepoImpl(this.stripeService, this.paymobService);

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

  @override
  Future<ApiResult<void>> makePaymentWithPaymob() async {
    await paymobService.getToken();
    final response = await paymobService.createIntent(
      CreateIntentRequestModel(
        amount: 2000,
        currency: "EGP",
        paymentMethods: [PaymobConfig.cardPaymentMethod],
        items: [
          ItemModel(
            name: "Test Item",
            amount: 2000,
            description: "Test",
            quantity: 1,
          ),
        ],
        billingData: BillingDataModel(
          apartment: "NA",
          firstName: "Test",
          lastName: "User",
          street: "Street",
          building: "1",
          phoneNumber: "+201000000000",
          city: "Cairo",
          country: "EG",
          email: "test@test.com",
          floor: "1",
          state: "Cairo",
        ),
        specialReference: "ORDER_1234",
        extras: {"test": true},
        expiration: 3600,
        notificationUrl: "https://test.com/webhook",
        redirectionUrl: "https://google.com",
      ),
    );

    print(response);

    final paymentKey = response.paymentKeys.first.key;

    print(paymentKey);

    return ApiResult.success(null);
  }
}
