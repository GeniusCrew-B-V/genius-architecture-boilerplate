import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/local/settings_local_data_source.dart';
import '../data/local/settings_local_data_source_impl.dart';
import '../data/theme_repository_impl.dart';
import '../domain/theme_repository.dart';
import '../ui/viewmodel/theme_viewmodel.dart';

List<SingleChildWidget> themePageProviders(SharedPreferences prefs) => [
      ..._independentServices(prefs),
      ..._dependentServices,
    ];

List<SingleChildWidget> _independentServices(SharedPreferences prefs) => [
      Provider<SharedPreferences>(
        create: (_) => prefs,
      ),
    ];

List<SingleChildWidget> _dependentServices = [
  ProxyProvider<SharedPreferences, SettingsLocalDataSource>(
    update: (_, prefs, themeLocalDataSource) =>
        SettingsLocalDataSourceImpl(prefs),
  ),
  ProxyProvider<SettingsLocalDataSource, ThemeRepository>(
    update: (context, themeRemoteDataSource, themeRepository) =>
        ThemeRepositoryImpl(themeRemoteDataSource),
  ),
  ChangeNotifierProxyProvider<ThemeRepository, ThemeViewModel>(
      create: (context) => ThemeViewModel(),
      update: (context, repository, viewModel) =>
          viewModel!..update(repository)),
];
