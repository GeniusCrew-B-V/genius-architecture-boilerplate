import 'package:json_annotation/json_annotation.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel {
  final bool success;
  final String? error;

  SignupResponseModel({required this.success, required this.error});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) => _$SignupResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignupResponseModelToJson(this);
}
