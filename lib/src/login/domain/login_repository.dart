import 'model/login_response_model.dart';

abstract class LoginRepository {
  Future<LoginResponseModel> loginUser(String email, String password);
}
