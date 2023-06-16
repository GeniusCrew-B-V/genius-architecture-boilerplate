import 'package:baseproject/src/start/ui/viewmodel/start_page_view_model_main.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../base/base_navigation/di/base_providers.dart';
import '../../base/base_navigation/ui/viewmodel/base_view_model_main.dart';
import '../../start/di/start_page_providers.dart';
import '../data/profile_page_repository_impl.dart';
import '../data/source/profile_page_data_source.dart';
import '../data/source/profile_page_remote_date_source_impl.dart';
import '../domain/profile_page_repository.dart';
import '../ui/viewmodel/profile_page_view_model_main.dart';

final _profilePageSourceProvider = Provider<ProfilePageDataSource>(
      (ref) {
    Dio dio = ref.watch(dioProvider);
    return ProfilePageDataSourceImpl(dio);
  },
);

final _profilePageRepositoryProvider = Provider<ProfilePageRepository>(
      (ref) {
    final ProfilePageDataSource dataSource = ref.watch(_profilePageSourceProvider);
    return ProfilePageRepositoryImpl(dataSource);
  },
);

final profilePageViewModelProvider = ChangeNotifierProvider<ProfilePageViewModelMain>((ref) {
  ProfilePageRepository repository = ref.watch(_profilePageRepositoryProvider);
  BaseViewModelMain baseViewModelMain = ref.watch(baseViewModelProvider);
  StartPageViewModelMain startPageViewModelMain = ref.watch(startViewModelProvider);
  return ProfilePageViewModelMain()..update(startPageViewModelMain,repository,baseViewModelMain);
});

