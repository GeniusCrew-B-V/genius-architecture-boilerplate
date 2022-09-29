// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkTokenResponseModel _$NetworkTokenResponseModelFromJson(
        Map<String, dynamic> json) =>
    NetworkTokenResponseModel(
      json['token'] as String,
      json['refresh_token'] as String,
      json['expiration'] as int,
    );

Map<String, dynamic> _$NetworkTokenResponseModelToJson(
        NetworkTokenResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refresh_token': instance.refreshToken,
      'expiration': instance.expiration,
    };
