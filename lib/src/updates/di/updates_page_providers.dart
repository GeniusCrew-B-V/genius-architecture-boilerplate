import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../base/base_navigation/di/base_providers.dart';
import '../../base/base_navigation/ui/viewmodel/base_view_model_main.dart';
import '../../start/di/start_page_providers.dart';
import '../data/source/updates_page_data_source.dart';
import '../data/source/updates_page_remote_date_source_impl.dart';
import '../data/updates_page_repository_impl.dart';
import '../domain/updates_page_repository.dart';
import '../ui/viewmodel/updates_page_view_model_main.dart';

final _updatesSourceProvider = Provider<UpdatesPageDataSource>(
  (ref) {
    Dio dio = ref.watch(dioProvider);
    return UpdatesPageDataSourceImpl(dio);
  },
);

final _updatesRepositoryProvider = Provider<UpdatesPageRepository>(
  (ref) {
    final UpdatesPageDataSource dataSource = ref.watch(_updatesSourceProvider);
    return UpdatesPageRepositoryImpl(dataSource);
  },
);


final updatesViewModelProvider = ChangeNotifierProvider<UpdatesPageViewModelMain>((ref) {
  UpdatesPageRepository repository = ref.watch(_updatesRepositoryProvider);
  BaseViewModelMain baseViewModelMain = ref.watch(baseViewModelProvider);
  return UpdatesPageViewModelMain()..update(repository,baseViewModelMain);
});
