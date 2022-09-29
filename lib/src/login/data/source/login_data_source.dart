import '../../domain/model/login_response_model.dart';

abstract class LoginDataSource {
  Future<LoginResponseModel> loginUser(String email, String password);
}
