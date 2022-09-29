import '../domain/base_repository.dart';
import '../domain/model/base_user_response_model.dart';
import 'source/base_remote_data_source.dart';

class BaseRepositoryImpl extends BaseRepository {
  final BaseRemoteDataSource _baseRemoteDataSource;

  BaseRepositoryImpl(this._baseRemoteDataSource);

  Future<BaseUserResponseModel> initUserDatas() => _baseRemoteDataSource.initUserDatas();
}
