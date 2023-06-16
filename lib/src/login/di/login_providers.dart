import 'package:baseproject/src/base/token/di/token_providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../base/token/domain/token_repository.dart';
import '../../start/di/start_page_providers.dart';
import '../data/login_repository_impl.dart';
import '../data/source/login_data_source.dart';
import '../data/source/login_date_source_impl.dart';
import '../domain/login_repository.dart';
import '../ui/viewmodel/login_view_model_main.dart';

final _loginSourceProvider = Provider<LoginDataSource>(
  (ref) {
    Dio dio = ref.watch(dioProvider);
    return LoginDataSourceImpl(dio);
  },
);

final _loginRepositoryProvider = Provider<LoginRepository>(
  (ref) {
    final LoginDataSource dataSource = ref.watch(_loginSourceProvider);
    return LoginRepositoryImpl(dataSource);
  },
);

final loginViewModelProvider = ChangeNotifierProvider<LoginViewModelMain>((ref) {
  LoginRepository repository = ref.watch(_loginRepositoryProvider);
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  return LoginViewModelMain()..update(repository, tokenRepository);
});
