import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'token')
  late String token;
  @JsonKey(name: 'refresh_token', defaultValue: 'empty_refresh_token')
  late String refreshToken;
  @JsonKey(name: 'timeout', defaultValue: 10800)
  late int timeout;

  LoginResponseModel({required this.token, required this.refreshToken, required this.timeout});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
