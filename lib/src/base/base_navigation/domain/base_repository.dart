import 'model/base_user_response_model.dart';

abstract class BaseRepository {
  Future<BaseUserResponseModel> initUserDatas();
}
