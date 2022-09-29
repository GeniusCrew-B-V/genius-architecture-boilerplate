import 'package:json_annotation/json_annotation.dart';

part 'base_user_response_model.g.dart';

@JsonSerializable()
class BaseUserResponseModel {
  @JsonKey(name: 'id')
  int? userId;
  String? email;
  String? username;
  String? name;
  String? surname;
  String? city;
  String? phoneNumber;

  BaseUserResponseModel({required this.username, required this.email, required this.name, required this.surname, required this.userId, required this.city, required this.phoneNumber});
  factory BaseUserResponseModel.fromJson(Map<String, dynamic> json) => _$BaseUserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BaseUserResponseModelToJson(this);
}
