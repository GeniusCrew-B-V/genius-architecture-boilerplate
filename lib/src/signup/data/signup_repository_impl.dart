import '../domain/model/signup_page_user_request_model.dart';
import '../domain/signup_repository.dart';
import 'source/signup_data_source.dart';

class SignupRepositoryImpl extends SignupRepository {
  final SignupDataSource _signupRemoteDataSource;

  SignupRepositoryImpl(this._signupRemoteDataSource);

  Future signupUser(SignupPageUserRequestModel signupPageUserRequestModel) => _signupRemoteDataSource.signupUser(signupPageUserRequestModel);
}
