import 'package:json_annotation/json_annotation.dart';
import 'package:payment/core/Payment/paymob/models/billing_data_model.dart';
import 'package:payment/core/Payment/paymob/models/item_model.dart';

part 'create_intent_request_model.g.dart';

@JsonSerializable()
class CreateIntentRequestModel {
  final int amount;
  final String currency;

  @JsonKey(name: "payment_methods")
  final List<int> paymentMethods;

  final List<ItemModel> items;

  @JsonKey(name: "billing_data")
  final BillingDataModel billingData;

  final Map<String, dynamic>? extras;

  @JsonKey(name: "special_reference")
  final String? specialReference;

  final int? expiration;

  @JsonKey(name: "notification_url")
  final String? notificationUrl;

  @JsonKey(name: "redirection_url")
  final String? redirectionUrl;

  CreateIntentRequestModel({
    required this.amount,
    required this.currency,
    required this.paymentMethods,
    required this.items,
    required this.billingData,
    this.extras,
    this.specialReference,
    this.expiration,
    this.notificationUrl,
    this.redirectionUrl,
  });

  factory CreateIntentRequestModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CreateIntentRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateIntentRequestModelToJson(this);
}