import 'package:payment/core/Payment/paymob/models/create_intent_request_model.dart';
import 'package:payment/core/Payment/paymob/models/response_create_intent/create_intent_response_model.dart';
import 'package:payment/core/networking/api_const.dart';
import 'package:payment/core/networking/network_service.dart';
import 'package:payment/core/utils/api_keys.dart';

class PaymobService {
  final NetworkService networkService;

  PaymobService({required this.networkService});

  Future<String> getToken() async {
    final response = await networkService.post(ApiConst.paymobAuth, {
      "api_key": ApiKeys.paymobApiKey,
    }, {});

    return response.data['token'];
  }

  /*
  step 2 create Intent it Need 
    1- secret key 
    2- will return  OrderId , intention Id , client secret 

  */

  Future<CreateIntentResponseModel> createIntent(
    CreateIntentRequestModel request,
  ) async {
    final response = await networkService
        .post(ApiConst.paymobCreateIntent, request.toJson(), {
          "Authorization": "Token ${ApiKeys.paymobSecretKey}",
          "Content-Type": "application/json",
        });
    print(response.data);
    return CreateIntentResponseModel.fromJson(response.data);
  }
}
