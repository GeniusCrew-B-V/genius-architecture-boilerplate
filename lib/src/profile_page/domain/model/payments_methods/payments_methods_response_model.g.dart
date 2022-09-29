// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_methods_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodResponseModel _$PaymentMethodResponseModelFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodResponseModel(
      id: json['id'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      cap: json['cap'] as String,
      number: json['number'] as String,
      isDefault: json['isDefault'] as bool,
      cardNumber: json['cardNumber'] as String,
      cvc: json['cvc'] as String,
      expiryDate: json['expiryDate'] as String,
      isBillingAddressTheSameAsDelivery:
          json['isBillingAddressTheSameAsDelivery'] as bool,
      nameOnCard: json['nameOnCard'] as String,
    );

Map<String, dynamic> _$PaymentMethodResponseModelToJson(
        PaymentMethodResponseModel instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'id': instance.id,
      'nameOnCard': instance.nameOnCard,
      'expiryDate': instance.expiryDate,
      'cvc': instance.cvc,
      'isDefault': instance.isDefault,
      'isBillingAddressTheSameAsDelivery':
          instance.isBillingAddressTheSameAsDelivery,
      'address': instance.address,
      'city': instance.city,
      'cap': instance.cap,
      'number': instance.number,
    };
