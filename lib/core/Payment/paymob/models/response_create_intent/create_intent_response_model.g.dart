// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_intent_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateIntentResponseModel _$CreateIntentResponseModelFromJson(
  Map<String, dynamic> json,
) => CreateIntentResponseModel(
  paymentKeys: (json['payment_keys'] as List<dynamic>)
      .map((e) => PaymentKeyModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  intentionOrderId: (json['intention_order_id'] as num).toInt(),
  id: json['id'] as String,
  intentionDetail: IntentionDetailModel.fromJson(
    json['intention_detail'] as Map<String, dynamic>,
  ),
  clientSecret: json['client_secret'] as String,
  paymentMethods: (json['payment_methods'] as List<dynamic>)
      .map(
        (e) => PaymentMethodResponseModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  specialReference: json['special_reference'] as String?,
  extras: json['extras'] == null
      ? null
      : ExtrasModel.fromJson(json['extras'] as Map<String, dynamic>),
  confirmed: json['confirmed'] as bool,
  status: json['status'] as String,
  created: json['created'] as String,
  cardDetail: json['card_detail'],
  cardTokens: json['card_tokens'] as List<dynamic>,
  object: json['object'] as String,
);

Map<String, dynamic> _$CreateIntentResponseModelToJson(
  CreateIntentResponseModel instance,
) => <String, dynamic>{
  'payment_keys': instance.paymentKeys.map((e) => e.toJson()).toList(),
  'intention_order_id': instance.intentionOrderId,
  'id': instance.id,
  'intention_detail': instance.intentionDetail.toJson(),
  'client_secret': instance.clientSecret,
  'payment_methods': instance.paymentMethods.map((e) => e.toJson()).toList(),
  'special_reference': instance.specialReference,
  'extras': instance.extras?.toJson(),
  'confirmed': instance.confirmed,
  'status': instance.status,
  'created': instance.created,
  'card_detail': instance.cardDetail,
  'card_tokens': instance.cardTokens,
  'object': instance.object,
};

PaymentKeyModel _$PaymentKeyModelFromJson(Map<String, dynamic> json) =>
    PaymentKeyModel(
      integration: (json['integration'] as num).toInt(),
      key: json['key'] as String,
      gatewayType: json['gateway_type'] as String,
      iframeId: json['iframe_id'],
      orderId: (json['order_id'] as num).toInt(),
    );

Map<String, dynamic> _$PaymentKeyModelToJson(PaymentKeyModel instance) =>
    <String, dynamic>{
      'integration': instance.integration,
      'key': instance.key,
      'gateway_type': instance.gatewayType,
      'iframe_id': instance.iframeId,
      'order_id': instance.orderId,
    };

IntentionDetailModel _$IntentionDetailModelFromJson(
  Map<String, dynamic> json,
) => IntentionDetailModel(
  amount: (json['amount'] as num).toInt(),
  items: (json['items'] as List<dynamic>)
      .map((e) => IntentionItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  currency: json['currency'] as String,
  billingData: BillingDataResponseModel.fromJson(
    json['billing_data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$IntentionDetailModelToJson(
  IntentionDetailModel instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'currency': instance.currency,
  'billing_data': instance.billingData.toJson(),
};

IntentionItemModel _$IntentionItemModelFromJson(Map<String, dynamic> json) =>
    IntentionItemModel(
      name: json['name'] as String,
      amount: (json['amount'] as num).toInt(),
      description: json['description'] as String,
      quantity: (json['quantity'] as num).toInt(),
      image: json['image'],
    );

Map<String, dynamic> _$IntentionItemModelToJson(IntentionItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'description': instance.description,
      'quantity': instance.quantity,
      'image': instance.image,
    };

BillingDataResponseModel _$BillingDataResponseModelFromJson(
  Map<String, dynamic> json,
) => BillingDataResponseModel(
  apartment: json['apartment'] as String,
  floor: json['floor'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  street: json['street'] as String,
  building: json['building'] as String,
  phoneNumber: json['phone_number'] as String,
  shippingMethod: json['shipping_method'] as String,
  city: json['city'] as String,
  country: json['country'] as String,
  state: json['state'] as String,
  email: json['email'] as String,
  postalCode: json['postal_code'] as String,
);

Map<String, dynamic> _$BillingDataResponseModelToJson(
  BillingDataResponseModel instance,
) => <String, dynamic>{
  'apartment': instance.apartment,
  'floor': instance.floor,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'street': instance.street,
  'building': instance.building,
  'phone_number': instance.phoneNumber,
  'shipping_method': instance.shippingMethod,
  'city': instance.city,
  'country': instance.country,
  'state': instance.state,
  'email': instance.email,
  'postal_code': instance.postalCode,
};

PaymentMethodResponseModel _$PaymentMethodResponseModelFromJson(
  Map<String, dynamic> json,
) => PaymentMethodResponseModel(
  integrationId: (json['integration_id'] as num).toInt(),
  alias: json['alias'],
  name: json['name'] as String?,
  methodType: json['method_type'] as String,
  currency: json['currency'] as String,
  live: json['live'] as bool,
  useCvcWithMoto: json['use_cvc_with_moto'] as bool,
);

Map<String, dynamic> _$PaymentMethodResponseModelToJson(
  PaymentMethodResponseModel instance,
) => <String, dynamic>{
  'integration_id': instance.integrationId,
  'alias': instance.alias,
  'name': instance.name,
  'method_type': instance.methodType,
  'currency': instance.currency,
  'live': instance.live,
  'use_cvc_with_moto': instance.useCvcWithMoto,
};

ExtrasModel _$ExtrasModelFromJson(Map<String, dynamic> json) => ExtrasModel(
  creationExtras: json['creation_extras'] as Map<String, dynamic>?,
  confirmationExtras: json['confirmation_extras'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$ExtrasModelToJson(ExtrasModel instance) =>
    <String, dynamic>{
      'creation_extras': instance.creationExtras,
      'confirmation_extras': instance.confirmationExtras,
    };
