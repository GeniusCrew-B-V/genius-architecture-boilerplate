import 'package:baseproject/src/start/ui/viewmodel/start_page_view_model_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../settings/ui/viewmodel/theme_viewmodel.dart';
import '../data/base_repository_impl.dart';
import '../data/source/base_remote_data_source.dart';
import '../data/source/base_remote_date_source_impl.dart';
import '../domain/base_repository.dart';
import '../ui/viewmodel/base_view_model_main.dart';

List<SingleChildWidget> baseProviders = [
  ..._dependentServices,
];

List<SingleChildWidget> _dependentServices = [
  ProxyProvider2<Dio, FirebaseFirestore, BaseRemoteDataSource>(
    update: (context, client, firebaseFirestore, baseRemoteDataSource) =>
        BaseRemoteDataSourceImpl(client),
  ),
  ProxyProvider<BaseRemoteDataSource, BaseRepository>(
    update: (context, baseRemoteDataSource, baseUpRepository) =>
        BaseRepositoryImpl(baseRemoteDataSource),
  ),
  ChangeNotifierProxyProvider3<BaseRepository, StartPageViewModelMain,
      ThemeViewModel, BaseViewModelMain>(
    create: (context) => BaseViewModelMain(),
    update:
        (context, repository, startPageViewModel, themeViewModel, viewModel) =>
            viewModel!..update(repository, startPageViewModel, themeViewModel),
  ),
];
