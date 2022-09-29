import 'package:json_annotation/json_annotation.dart';

part 'network_token_response_model.g.dart';

@JsonSerializable()
class NetworkTokenResponseModel {
  final String token;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  final int expiration;

  NetworkTokenResponseModel(this.token, this.refreshToken, this.expiration);

  factory NetworkTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkTokenResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkTokenResponseModelToJson(this);
}
