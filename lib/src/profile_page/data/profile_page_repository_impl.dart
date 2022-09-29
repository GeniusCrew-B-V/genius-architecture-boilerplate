import '../../base/base_navigation/domain/model/base_user_response_model.dart';
import '../domain/model/profile_page_user_request_model.dart';
import '../domain/profile_page_repository.dart';
import 'source/profile_page_data_source.dart';

class ProfilePageRepositoryImpl extends ProfilePageRepository {
  final ProfilePageDataSource _profilePageRemoteDataSource;

  ProfilePageRepositoryImpl(this._profilePageRemoteDataSource);

  Future<BaseUserResponseModel> saveUserChanges(ProfilePageUserRequestModel model) => _profilePageRemoteDataSource.saveUserChanges(model);
}
