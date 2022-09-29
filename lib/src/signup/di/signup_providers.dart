import 'package:baseproject/src/signup/data/source/signup_remote_date_source_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/signup_repository_impl.dart';
import '../data/source/signup_data_source.dart';
import '../domain/signup_repository.dart';
import '../ui/viewmodel/signup_view_model_main.dart';

List<SingleChildWidget> signupProviders = [
  ..._dependentServices,
];

List<SingleChildWidget> _dependentServices = [
  ProxyProvider2<Dio, FirebaseFirestore, SignupDataSource>(
    update: (context, client, firebaseFirestore, signupRemoteDataSource) =>
        SignupDataSourceImpl(client),
  ),
  ProxyProvider<SignupDataSource, SignupRepository>(
    update: (context, signupRemoteDataSource, signUpRepository) =>
        SignupRepositoryImpl(signupRemoteDataSource),
  ),
  ChangeNotifierProxyProvider<SignupRepository, SignipViewModelMain>(
      create: (context) => SignipViewModelMain(),
      update: (context, repository, viewModel) =>
          viewModel!..update(repository)),
];
