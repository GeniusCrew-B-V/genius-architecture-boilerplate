import 'package:baseproject/src/base/base_navigation/domain/model/base_user_response_model.dart';

import 'model/profile_page_user_request_model.dart';

abstract class ProfilePageRepository {
  Future<BaseUserResponseModel> saveUserChanges(ProfilePageUserRequestModel model);
}
