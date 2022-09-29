import '../../../base/base_navigation/domain/model/base_user_response_model.dart';
import '../../domain/model/profile_page_user_request_model.dart';

abstract class ProfilePageDataSource {
  Future<BaseUserResponseModel> saveUserChanges(ProfilePageUserRequestModel model);
}
