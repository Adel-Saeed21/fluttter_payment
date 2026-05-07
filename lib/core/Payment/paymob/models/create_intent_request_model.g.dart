// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_intent_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateIntentRequestModel _$CreateIntentRequestModelFromJson(
  Map<String, dynamic> json,
) => CreateIntentRequestModel(
  amount: (json['amount'] as num).toInt(),
  currency: json['currency'] as String,
  paymentMethods: (json['payment_methods'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  items: (json['items'] as List<dynamic>)
      .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  billingData: BillingDataModel.fromJson(
    json['billing_data'] as Map<String, dynamic>,
  ),
  extras: json['extras'] as Map<String, dynamic>?,
  specialReference: json['special_reference'] as String?,
  expiration: (json['expiration'] as num?)?.toInt(),
  notificationUrl: json['notification_url'] as String?,
  redirectionUrl: json['redirection_url'] as String?,
);

Map<String, dynamic> _$CreateIntentRequestModelToJson(
  CreateIntentRequestModel instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
  'payment_methods': instance.paymentMethods,
  'items': instance.items,
  'billing_data': instance.billingData,
  'extras': instance.extras,
  'special_reference': instance.specialReference,
  'expiration': instance.expiration,
  'notification_url': instance.notificationUrl,
  'redirection_url': instance.redirectionUrl,
};
