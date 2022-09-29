import 'package:json_annotation/json_annotation.dart';

part 'signup_page_user_request_model.g.dart';

@JsonSerializable()
class SignupPageUserRequestModel {
  late String username;
  late String email;
  late String password;
  late String name;
  late String surname;
  late bool acceptedPoint2A;
  late bool acceptedPoint2B0;
  late bool acceptedPoint2B1;
  late bool acceptedPoint2B2;
  late bool acceptedPoint2B3;

  SignupPageUserRequestModel({
    required this.username,
    required this.email,
    required this.name,
    required this.surname,
    required this.password,
    required this.acceptedPoint2A,
    required this.acceptedPoint2B0,
    required this.acceptedPoint2B1,
    required this.acceptedPoint2B2,
    required this.acceptedPoint2B3,
  });

  SignupPageUserRequestModel toDomain() {
    return SignupPageUserRequestModel(
        name: name,
        acceptedPoint2A: acceptedPoint2A,
        acceptedPoint2B0: acceptedPoint2B0,
        acceptedPoint2B1: acceptedPoint2B1,
        acceptedPoint2B2: acceptedPoint2B2,
        acceptedPoint2B3: acceptedPoint2B3,
        email: email,
        password: password,
        surname: surname,
        username: username);
  }

  SignupPageUserRequestModel.fromModel(SignupPageUserRequestModel domainModel) {
    name = domainModel.name;
    surname = domainModel.surname;
    username = domainModel.username;
    email = domainModel.email;
    password = domainModel.password;
    acceptedPoint2A = domainModel.acceptedPoint2A;
    acceptedPoint2B0 = domainModel.acceptedPoint2B0;
    acceptedPoint2B1 = domainModel.acceptedPoint2B1;
    acceptedPoint2B2 = domainModel.acceptedPoint2B2;
    acceptedPoint2B3 = domainModel.acceptedPoint2B3;
  }

  factory SignupPageUserRequestModel.fromJson(Map<String, dynamic> json) => _$SignupPageUserRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignupPageUserRequestModelToJson(this);
}
