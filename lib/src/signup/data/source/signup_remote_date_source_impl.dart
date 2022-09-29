import 'package:baseproject/src/signup/domain/model/signup_response_model.dart';
import 'package:dio/dio.dart';

import '../../domain/model/signup_exception.dart';
import '../../domain/model/signup_page_user_request_model.dart';
import 'signup_data_source.dart';

class SignupDataSourceImpl extends SignupDataSource {
  final Dio _dio;

  SignupDataSourceImpl(this._dio);

  Future signupUser(SignupPageUserRequestModel signupPageUserRequestModel) async {
    try {
      SignupPageUserRequestModel userModel = SignupPageUserRequestModel.fromModel(signupPageUserRequestModel);
      final response = await _dio.post(
        "/v1/signup",
        data: userModel.toJson(),
      );
      SignupResponseModel signupResponse = SignupResponseModel.fromJson(response.data);
      return signupResponse;
    } catch (e) {
      if (e == 'weak-password') {
        return Future.error(SignupException.weakPassword);
      } else if (e == 'email-already-in-use') {
        return Future.error(SignupException.emailAlreadyInUse);
      } else if (e == 'invalid-email') {
        return Future.error(SignupException.invalidEmail);
      } else
        return Future.error(SignupException.genericError);
    }
  }
}
