import 'package:baseproject/src/start/ui/viewmodel/start_page_view_model_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../base/base_navigation/ui/viewmodel/base_view_model_main.dart';
import '../data/profile_page_repository_impl.dart';
import '../data/source/profile_page_data_source.dart';
import '../data/source/profile_page_remote_date_source_impl.dart';
import '../domain/profile_page_repository.dart';
import '../ui/viewmodel/profile_page_view_model_main.dart';

List<SingleChildWidget> profilePageProviders = [
  ..._dependentServices,
];

List<SingleChildWidget> _dependentServices = [
  ProxyProvider2<Dio, FirebaseFirestore, ProfilePageDataSource>(
    update: (context, client, firebaseFirestore, profilePageRemoteDataSource) =>
        ProfilePageDataSourceImpl(client, firebaseFirestore),
  ),
  ProxyProvider<ProfilePageDataSource, ProfilePageRepository>(
    update: (context, profilePageRemoteDataSource, profilePageUpRepository) =>
        ProfilePageRepositoryImpl(profilePageRemoteDataSource),
  ),
  ChangeNotifierProxyProvider3<StartPageViewModelMain, ProfilePageRepository,
      BaseViewModelMain, ProfilePageViewModelMain>(
    create: (context) => ProfilePageViewModelMain(),
    update:
        (context, startPageViewModel, repository, baseViewModel, viewModel) =>
            viewModel!
              ..update(
                startPageViewModel,
                repository,
                baseViewModel,
              ),
  ),
];
