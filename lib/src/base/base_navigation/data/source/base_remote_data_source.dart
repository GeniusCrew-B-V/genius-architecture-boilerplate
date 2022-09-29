import '../../domain/model/base_user_response_model.dart';

abstract class BaseRemoteDataSource {
  Future<BaseUserResponseModel> initUserDatas();
}
