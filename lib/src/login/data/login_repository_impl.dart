import 'package:baseproject/src/login/domain/model/login_response_model.dart';

import '../domain/login_repository.dart';
import 'source/login_data_source.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDataSource _loginRemoteDataSource;

  LoginRepositoryImpl(this._loginRemoteDataSource);

  Future<LoginResponseModel> loginUser(String email, String password) => _loginRemoteDataSource.loginUser(email, password);
}
