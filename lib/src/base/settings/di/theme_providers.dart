import 'package:baseproject/src/base/settings/ui/viewmodel/theme_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../start/di/start_page_providers.dart';
import '../data/local/settings_local_data_source.dart';
import '../data/local/settings_local_data_source_impl.dart';
import '../data/theme_repository_impl.dart';
import '../domain/theme_repository.dart';

final _themeDataSourceProvider = Provider.family<SettingsLocalDataSource, SharedPreferences>(
  (ref, preferences) {
    return SettingsLocalDataSourceImpl(preferences);
  },
);

final _themeRepositoryProvider = Provider<ThemeRepository>(
  (ref) {
    final SharedPreferences? preferences = ref.watch(preferencesProvider!);
    final SettingsLocalDataSource dataSource = ref.watch(_themeDataSourceProvider(preferences!));
    return ThemeRepositoryImpl(dataSource);
  },
);

final themeViewModelProvider = ChangeNotifierProvider<ThemeViewModel>((ref) {
  ThemeRepository? repository = ref.watch(_themeRepositoryProvider);
  return ThemeViewModel(repository!);
});
