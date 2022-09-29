// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_page_user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupPageUserRequestModel _$SignupPageUserRequestModelFromJson(
        Map<String, dynamic> json) =>
    SignupPageUserRequestModel(
      username: json['username'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      password: json['password'] as String,
      acceptedPoint2A: json['acceptedPoint2A'] as bool,
      acceptedPoint2B0: json['acceptedPoint2B0'] as bool,
      acceptedPoint2B1: json['acceptedPoint2B1'] as bool,
      acceptedPoint2B2: json['acceptedPoint2B2'] as bool,
      acceptedPoint2B3: json['acceptedPoint2B3'] as bool,
    );

Map<String, dynamic> _$SignupPageUserRequestModelToJson(
        SignupPageUserRequestModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'surname': instance.surname,
      'acceptedPoint2A': instance.acceptedPoint2A,
      'acceptedPoint2B0': instance.acceptedPoint2B0,
      'acceptedPoint2B1': instance.acceptedPoint2B1,
      'acceptedPoint2B2': instance.acceptedPoint2B2,
      'acceptedPoint2B3': instance.acceptedPoint2B3,
    };
