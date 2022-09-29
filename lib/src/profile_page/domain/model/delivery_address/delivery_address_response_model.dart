import 'package:json_annotation/json_annotation.dart';

part 'delivery_address_response_model.g.dart';

@JsonSerializable()
class DeliveryAddressResponseModel {
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'city')
  final String city;
  @JsonKey(name: 'cap')
  final String cap;
  @JsonKey(name: 'number')
  final String number;
  @JsonKey(name: 'isDefault')
  final bool isDefault;

  DeliveryAddressResponseModel({
    required this.id,
    required this.address,
    required this.city,
    required this.cap,
    required this.number,
    required this.isDefault,
  });

  factory DeliveryAddressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeliveryAddressResponseModelToJson(this);
}
