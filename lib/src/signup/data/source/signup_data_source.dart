import 'package:baseproject/src/signup/domain/model/signup_page_user_request_model.dart';

abstract class SignupDataSource {
  Future signupUser(SignupPageUserRequestModel signupPageUserRequestModel);
}
