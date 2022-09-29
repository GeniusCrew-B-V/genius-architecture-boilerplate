import 'package:json_annotation/json_annotation.dart';

part 'payments_methods_response_model.g.dart';

@JsonSerializable()
class PaymentMethodResponseModel {
  @JsonKey(name: 'cardNumber')
  final String cardNumber;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'nameOnCard')
  final String nameOnCard;
  @JsonKey(name: 'expiryDate')
  final String expiryDate;
  @JsonKey(name: 'cvc')
  final String cvc;
  @JsonKey(name: 'isDefault')
  final bool isDefault;
  @JsonKey(name: 'isBillingAddressTheSameAsDelivery')
  final bool isBillingAddressTheSameAsDelivery;
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'city')
  final String city;
  @JsonKey(name: 'cap')
  final String cap;
  @JsonKey(name: 'number')
  final String number;

  PaymentMethodResponseModel(
      {required this.id,
      required this.address,
      required this.city,
      required this.cap,
      required this.number,
      required this.isDefault,
      required this.cardNumber,
      required this.cvc,
      required this.expiryDate,
      required this.isBillingAddressTheSameAsDelivery,
      required this.nameOnCard});

  factory PaymentMethodResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodResponseModelToJson(this);
}
