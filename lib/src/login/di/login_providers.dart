import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../base/token/domain/token_repository.dart';
import '../data/login_repository_impl.dart';
import '../data/source/login_data_source.dart';
import '../data/source/login_date_source_impl.dart';
import '../domain/login_repository.dart';
import '../ui/viewmodel/login_view_model_main.dart';

List<SingleChildWidget> loginProviders = [
  ..._dependentServices,
];

List<SingleChildWidget> _dependentServices = [
  ProxyProvider<Dio, LoginDataSource>(
    update: (context, client, loginRemoteDataSource) =>
        LoginDataSourceImpl(client),
  ),
  ProxyProvider<LoginDataSource, LoginRepository>(
    update: (context, loginRemoteDataSource, loginUpRepository) =>
        LoginRepositoryImpl(loginRemoteDataSource),
  ),
  ChangeNotifierProxyProvider2<LoginRepository, TokenRepository,
          LoginViewModelMain>(
      create: (context) => LoginViewModelMain(),
      update: (context, repository, tokenRepository, viewModel) =>
          viewModel!..update(repository, tokenRepository)),
];
