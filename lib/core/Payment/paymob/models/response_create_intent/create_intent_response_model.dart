import 'package:json_annotation/json_annotation.dart';

part 'create_intent_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateIntentResponseModel {
  @JsonKey(name: "payment_keys")
  final List<PaymentKeyModel> paymentKeys;

  @JsonKey(name: "intention_order_id")
  final int intentionOrderId;

  final String id;

  @JsonKey(name: "intention_detail")
  final IntentionDetailModel intentionDetail;

  @JsonKey(name: "client_secret")
  final String clientSecret;

  @JsonKey(name: "payment_methods")
  final List<PaymentMethodResponseModel> paymentMethods;

  @JsonKey(name: "special_reference")
  final String? specialReference;

  final ExtrasModel? extras;

  final bool confirmed;

  final String status;

  final String created;

  @JsonKey(name: "card_detail")
  final dynamic cardDetail;

  @JsonKey(name: "card_tokens")
  final List<dynamic> cardTokens;

  final String object;

  CreateIntentResponseModel({
    required this.paymentKeys,
    required this.intentionOrderId,
    required this.id,
    required this.intentionDetail,
    required this.clientSecret,
    required this.paymentMethods,
    this.specialReference,
    this.extras,
    required this.confirmed,
    required this.status,
    required this.created,
    this.cardDetail,
    required this.cardTokens,
    required this.object,
  });

  factory CreateIntentResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CreateIntentResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateIntentResponseModelToJson(this);
}

@JsonSerializable()
class PaymentKeyModel {
  final int integration;
  final String key;

  @JsonKey(name: "gateway_type")
  final String gatewayType;

  @JsonKey(name: "iframe_id")
  final dynamic iframeId;

  @JsonKey(name: "order_id")
  final int orderId;

  PaymentKeyModel({
    required this.integration,
    required this.key,
    required this.gatewayType,
    this.iframeId,
    required this.orderId,
  });

  factory PaymentKeyModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PaymentKeyModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PaymentKeyModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IntentionDetailModel {
  final int amount;

  final List<IntentionItemModel> items;

  final String currency;

  @JsonKey(name: "billing_data")
  final BillingDataResponseModel billingData;

  IntentionDetailModel({
    required this.amount,
    required this.items,
    required this.currency,
    required this.billingData,
  });

  factory IntentionDetailModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$IntentionDetailModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IntentionDetailModelToJson(this);
}

@JsonSerializable()
class IntentionItemModel {
  final String name;

  final int amount;

  final String description;

  final int quantity;

  final dynamic image;

  IntentionItemModel({
    required this.name,
    required this.amount,
    required this.description,
    required this.quantity,
    this.image,
  });

  factory IntentionItemModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$IntentionItemModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IntentionItemModelToJson(this);
}

@JsonSerializable()
class BillingDataResponseModel {
  final String apartment;

  final String floor;

  @JsonKey(name: "first_name")
  final String firstName;

  @JsonKey(name: "last_name")
  final String lastName;

  final String street;

  final String building;

  @JsonKey(name: "phone_number")
  final String phoneNumber;

  @JsonKey(name: "shipping_method")
  final String shippingMethod;

  final String city;

  final String country;

  final String state;

  final String email;

  @JsonKey(name: "postal_code")
  final String postalCode;

  BillingDataResponseModel({
    required this.apartment,
    required this.floor,
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.building,
    required this.phoneNumber,
    required this.shippingMethod,
    required this.city,
    required this.country,
    required this.state,
    required this.email,
    required this.postalCode,
  });

  factory BillingDataResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BillingDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BillingDataResponseModelToJson(this);
}

@JsonSerializable()
class PaymentMethodResponseModel {
  @JsonKey(name: "integration_id")
  final int integrationId;

  final dynamic alias;

  final String? name;

  @JsonKey(name: "method_type")
  final String methodType;

  final String currency;

  final bool live;

  @JsonKey(name: "use_cvc_with_moto")
  final bool useCvcWithMoto;

  PaymentMethodResponseModel({
    required this.integrationId,
    this.alias,
     this.name,
    required this.methodType,
    required this.currency,
    required this.live,
    required this.useCvcWithMoto,
  });

  factory PaymentMethodResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PaymentMethodResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PaymentMethodResponseModelToJson(this);
}

@JsonSerializable()
class ExtrasModel {
  @JsonKey(name: "creation_extras")
  final Map<String, dynamic>? creationExtras;

  @JsonKey(name: "confirmation_extras")
  final Map<String, dynamic>? confirmationExtras;

  ExtrasModel({
    this.creationExtras,
    this.confirmationExtras,
  });

  factory ExtrasModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ExtrasModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ExtrasModelToJson(this);
}