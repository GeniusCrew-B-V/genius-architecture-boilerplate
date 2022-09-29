import 'package:json_annotation/json_annotation.dart';

part 'network_refresh_token_request_model.g.dart';

@JsonSerializable()
class NetworkRefreshTokenRequestModel {
  @JsonKey(name: "refresh_token")
  final String refreshToken;

  NetworkRefreshTokenRequestModel(this.refreshToken);

  factory NetworkRefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkRefreshTokenRequestModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$NetworkRefreshTokenRequestModelToJson(this);
}
