import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../base/base_navigation/ui/viewmodel/base_view_model_main.dart';
import '../data/source/updates_page_data_source.dart';
import '../data/source/updates_page_remote_date_source_impl.dart';
import '../data/updates_page_repository_impl.dart';
import '../domain/updates_page_repository.dart';
import '../ui/viewmodel/updates_page_view_model_main.dart';

List<SingleChildWidget> updatePageProviders = [
  ..._dependentServices,
];

List<SingleChildWidget> _dependentServices = [
  ProxyProvider2<Dio, FirebaseFirestore, UpdatesPageDataSource>(
    update: (context, client, firebaseFirestore, updatesPageRemoteDataSource) => UpdatesPageDataSourceImpl(client),
  ),
  ProxyProvider<UpdatesPageDataSource, UpdatesPageRepository>(
    update: (context, updatesPageRemoteDataSource, updatesPageUpRepository) => UpdatesPageRepositoryImpl(updatesPageRemoteDataSource),
  ),
  ChangeNotifierProxyProvider2<UpdatesPageRepository, BaseViewModelMain, UpdatesPageViewModelMain>(
    create: (context) => UpdatesPageViewModelMain(),
    update: (context, repository, baseViewModelMain, viewModel) => viewModel!..update(repository, baseViewModelMain),
  ),
];
