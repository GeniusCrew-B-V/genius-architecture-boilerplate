import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../resources/app_config.dart';
import '../../network/dio_provider.dart';
import '../../network/token_incerceptor.dart';
import '../data/local/token_local_data_source.dart';
import '../data/local/token_local_data_source_impl.dart';
import '../data/remote/token_remote_data_source.dart';
import '../data/remote/token_remote_data_source_impl.dart';
import '../data/token_repository_impl.dart';
import '../domain/token_repository.dart';

List<SingleChildWidget> tokenProviders = [
  ..._dependentServices,
];

List<SingleChildWidget> _dependentServices = [
  ProxyProvider<SharedPreferences, TokenLocalDataSource>(
    update: (_, prefs, tokenDataSource) => TokenLocalDataSourceImpl(prefs),
  ),
  ProxyProvider<AppConfig, TokenRemoteDataSource>(
    update: (_, appConfig, tokenDataSource) => TokenRemoteDataSourceImpl(
      provideDio(appConfig: appConfig),
    ),
  ),
  ProxyProvider2<TokenLocalDataSource, TokenRemoteDataSource, TokenRepository>(
    update: (_, tokenLocalDataSource, tokenRemoteDataSource, tokenRepository) =>
        TokenRepositoryImpl(
      tokenLocalDataSource,
    ),
  ),
  ProxyProvider<TokenRepository, TokenInterceptor>(
    update: (_, tokenRepository, __) => TokenInterceptor(tokenRepository),
  ),
];
