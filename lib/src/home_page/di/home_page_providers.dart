import 'package:baseproject/src/base/base_navigation/di/base_providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../base/base_navigation/ui/viewmodel/base_view_model_main.dart';
import '../../start/di/start_page_providers.dart';
import '../data/home_page_repository_impl.dart';
import '../data/source/home_page_data_source.dart';
import '../data/source/home_page_remote_date_source_impl.dart';
import '../domain/home_page_repository.dart';
import '../ui/viewmodel/home_page_view_model_main.dart';

final _homePageSourceProvider = Provider<HomePageDataSource>(
      (ref) {
    Dio dio = ref.watch(dioProvider);
    return HomePageDataSourceImpl(dio);
  },
);

final _homePageRepositoryProvider = Provider<HomePageRepository>(
      (ref) {
    final HomePageDataSource dataSource = ref.watch(_homePageSourceProvider);
    return HomePageRepositoryImpl(dataSource);
  },
);

final homePageViewModelProvider = ChangeNotifierProvider<HomePageViewModelMain>((ref) {
  HomePageRepository repository = ref.watch(_homePageRepositoryProvider);
  BaseViewModelMain baseViewModelMain = ref.watch(baseViewModelProvider);
  return HomePageViewModelMain()..update(repository, baseViewModelMain);
});

