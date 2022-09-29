// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseUserResponseModel _$BaseUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    BaseUserResponseModel(
      username: json['username'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      userId: json['id'] as int?,
      city: json['city'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$BaseUserResponseModelToJson(
        BaseUserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'email': instance.email,
      'username': instance.username,
      'name': instance.name,
      'surname': instance.surname,
      'city': instance.city,
      'phoneNumber': instance.phoneNumber,
    };
