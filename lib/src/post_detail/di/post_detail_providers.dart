import 'package:baseproject/src/base/base_navigation/ui/viewmodel/base_view_model_main.dart';
import 'package:baseproject/src/post_detail/data/post_detail_repository_impl.dart';
import 'package:baseproject/src/post_detail/data/source/post_detail_data_source.dart';
import 'package:baseproject/src/post_detail/data/source/post_detail_remote_data_source_impl.dart';
import 'package:baseproject/src/post_detail/domain/post_detail_repository.dart';
import 'package:baseproject/src/post_detail/ui/viewmodel/post_detail_view_model_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> postDetailProviders = [
  ..._dependentServices,
];

List<SingleChildWidget> _dependentServices = [
  ProxyProvider2<Dio, FirebaseFirestore, PostDetailDataSource>(
    update: (context, client, firebaseFirestore, postDetailRemoteDataSource) =>
        PostDetailDataSourceImpl(client),
  ),
  ProxyProvider<PostDetailDataSource, PostDetailRepository>(
    update: (context, postDetailRemoteDataSource, postDetailRepository) =>
        PostDetailRepositoryImpl(postDetailRemoteDataSource),
  ),
  ChangeNotifierProxyProvider2<PostDetailRepository, BaseViewModelMain,
      PostDetailViewModelMain>(
    create: (context) => PostDetailViewModelMain(),
    update: (context, repository, baseViewModelMain, viewModel) =>
        viewModel!..update(repository, baseViewModelMain),
  ),
];
