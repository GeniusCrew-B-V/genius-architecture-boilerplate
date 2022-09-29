import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../base/base_navigation/ui/viewmodel/base_view_model_main.dart';
import '../data/home_page_repository_impl.dart';
import '../data/source/home_page_data_source.dart';
import '../data/source/home_page_remote_date_source_impl.dart';
import '../domain/home_page_repository.dart';
import '../ui/viewmodel/home_page_view_model_main.dart';

List<SingleChildWidget> homePageProviders = [
  ..._dependentServices,
];

List<SingleChildWidget> _dependentServices = [
  ProxyProvider2<Dio, FirebaseFirestore, HomePageDataSource>(
    update: (context, client, firebaseFirestore, homePageRemoteDataSource) => HomePageDataSourceImpl(client, firebaseFirestore),
  ),
  ProxyProvider<HomePageDataSource, HomePageRepository>(
    update: (context, homePageRemoteDataSource, homePageUpRepository) => HomePageRepositoryImpl(homePageRemoteDataSource),
  ),
  ChangeNotifierProxyProvider2<HomePageRepository, BaseViewModelMain, HomePageViewModelMain>(
    create: (context) => HomePageViewModelMain(),
    update: (context, repository, baseViewModelMain, viewModel) => viewModel!..update(repository, baseViewModelMain),
  ),
];
