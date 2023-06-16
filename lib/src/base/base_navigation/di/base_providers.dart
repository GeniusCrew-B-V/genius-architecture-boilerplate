import 'package:baseproject/src/base/settings/di/theme_providers.dart';
import 'package:baseproject/src/start/di/start_page_providers.dart';
import 'package:baseproject/src/start/ui/viewmodel/start_page_view_model_main.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../settings/ui/viewmodel/theme_viewmodel.dart';
import '../data/base_repository_impl.dart';
import '../data/source/base_remote_data_source.dart';
import '../data/source/base_remote_date_source_impl.dart';
import '../domain/base_repository.dart';
import '../ui/viewmodel/base_view_model_main.dart';

final _baseDataSource = Provider<BaseRemoteDataSource>((ref) {
  Dio dio = ref.watch(dioProvider);
  return BaseRemoteDataSourceImpl(dio);
});

final _baseRepository = Provider<BaseRepositoryImpl>((ref) {
  BaseRemoteDataSource dataSource = ref.watch(_baseDataSource);
  return BaseRepositoryImpl(dataSource);
});

final baseViewModelProvider = ChangeNotifierProvider<BaseViewModelMain>((ref) {
  BaseRepository repository = ref.watch(_baseRepository);
  StartPageViewModelMain startPageViewModelMain = ref.watch(startViewModelProvider);
  ThemeViewModel themeViewModel = ref.watch(themeViewModelProvider);
  return BaseViewModelMain()..update(repository, startPageViewModelMain, themeViewModel);
});
