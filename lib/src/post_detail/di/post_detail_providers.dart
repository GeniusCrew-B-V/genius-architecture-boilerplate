import 'package:baseproject/src/base/base_navigation/ui/viewmodel/base_view_model_main.dart';
import 'package:baseproject/src/post_detail/data/post_detail_repository_impl.dart';
import 'package:baseproject/src/post_detail/data/source/post_detail_data_source.dart';
import 'package:baseproject/src/post_detail/data/source/post_detail_remote_data_source_impl.dart';
import 'package:baseproject/src/post_detail/domain/post_detail_repository.dart';
import 'package:baseproject/src/post_detail/ui/viewmodel/post_detail_view_model_main.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../base/base_navigation/di/base_providers.dart';
import '../../start/di/start_page_providers.dart';

final _postDetailSourceProvider = Provider<PostDetailDataSource>(
      (ref) {
    Dio dio = ref.watch(dioProvider);
    return PostDetailDataSourceImpl(dio);
  },
);

final _postDetailRepositoryProvider = Provider<PostDetailRepository>(
      (ref) {
    final PostDetailDataSource dataSource = ref.watch(_postDetailSourceProvider);
    return PostDetailRepositoryImpl(dataSource);
  },
);

final postDetailViewModelProvider = ChangeNotifierProvider<PostDetailViewModelMain>((ref) {
  PostDetailRepository repository = ref.watch(_postDetailRepositoryProvider);
  BaseViewModelMain baseViewModelMain = ref.watch(baseViewModelProvider);
  return PostDetailViewModelMain()..update(repository,baseViewModelMain);
});