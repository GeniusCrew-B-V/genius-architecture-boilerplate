// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_address_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryAddressResponseModel _$DeliveryAddressResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeliveryAddressResponseModel(
      id: json['id'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      cap: json['cap'] as String,
      number: json['number'] as String,
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$DeliveryAddressResponseModelToJson(
        DeliveryAddressResponseModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'city': instance.city,
      'cap': instance.cap,
      'number': instance.number,
      'isDefault': instance.isDefault,
    };
