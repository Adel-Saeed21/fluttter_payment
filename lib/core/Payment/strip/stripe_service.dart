import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Features/checkout/data/create_user_stripe_model.dart';
import 'package:payment/Features/checkout/data/models/init_payhment_sheet_input_model.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment/Features/checkout/data/payment_intent_request_model.dart';
import 'package:payment/core/networking/api_const.dart';
import 'package:payment/core/networking/network_service.dart';
import 'package:payment/core/utils/api_keys.dart';

class StripeService {
  final NetworkService networkService;

  StripeService({required this.networkService});

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentRequestModel request,
  ) async {
    final response = await networkService.post(
      ApiConst.paymentIntent,
      request.toJson(),
      {'Authorization': 'Bearer ${ApiKeys.stripeSecret}'},
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<String> createStripeUser(CreateUserStripeModel userStripe) async {
    final response = await networkService.post(
      ApiConst.createStripCustomer,
      userStripe.toJson(),
      {'Authorization': 'Bearer ${ApiKeys.stripeSecret}'},
    );
    return response.data['cus_id'];
  }

  Future initPaymentSheet(
    InitPayhmentSheetInputModel initPayhmentSheetInputModel,
  ) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPayhmentSheetInputModel.clientsecret,
        customerEphemeralKeySecret: initPayhmentSheetInputModel.ephemeralKey,
        customerId: initPayhmentSheetInputModel.customerId,
        merchantDisplayName: 'Attendo Stripe',
      ),
    );
  }

  /*
  TODO: don't forget create model for eohemeral key request
 */
  Future<String> createEphermeralKey(String customerId) async {
    final response = await networkService.post(
      ApiConst.createEpheremalKeys,
      {'customer': customerId},
      {
        'Stripe-Version': '2023-08-16',
        'Authorization': 'Bearer ${ApiKeys.stripeSecret}',
      },
    );
    return response.data;
  }

  Future presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(PaymentIntentRequestModel request) async {
    final paymentIntent = await createPaymentIntent(request);
   final emphemeralKey = await createEphermeralKey( request.customerId!);



    var initPayhmentSheetInputModel = InitPayhmentSheetInputModel(
      customerId: request.customerId!,
      clientsecret: paymentIntent.clientSecret!,
      ephemeralKey: emphemeralKey,
    );
    await initPaymentSheet(initPayhmentSheetInputModel);
    await presentPaymentSheet();
  }
}
