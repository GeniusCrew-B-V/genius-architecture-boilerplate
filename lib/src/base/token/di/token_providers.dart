import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../resources/app_config.dart';
import '../../../start/di/start_page_providers.dart';
import '../../network/dio_provider.dart';
import '../../network/token_incerceptor.dart';
import '../data/local/token_local_data_source.dart';
import '../data/local/token_local_data_source_impl.dart';
import '../data/remote/token_remote_data_source.dart';
import '../data/remote/token_remote_data_source_impl.dart';
import '../data/token_repository_impl.dart';
import '../domain/token_repository.dart';

final _tokenRemoteDataSourceProvider = Provider<TokenRemoteDataSource>(
  (ref) {
    AppConfig appConfig = ref.watch(appConfigProviders!);
    return TokenRemoteDataSourceImpl(provideDio(appConfig: appConfig));
  },
);

final _tokenDataSourceProvider = Provider.family<TokenLocalDataSource, SharedPreferences>(
  (ref, preferences) {
    return TokenLocalDataSourceImpl(preferences);
  },
);

final tokenRepositoryProvider = Provider<TokenRepository>(
  (ref) {
    final SharedPreferences preferences = ref.watch(preferencesProvider!);
    final TokenLocalDataSource dataSource = ref.watch(_tokenDataSourceProvider(preferences));
    final TokenRemoteDataSource remoteDataSource = ref.watch(_tokenRemoteDataSourceProvider);
    return TokenRepositoryImpl(dataSource,remoteDataSource);
  },
);

final tokenInterceptorProvider = Provider<TokenInterceptor>((ref) {
  TokenRepository repository = ref.watch(tokenRepositoryProvider);
  return TokenInterceptor(repository);
});
