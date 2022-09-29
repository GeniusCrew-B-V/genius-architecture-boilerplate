import '../domain/theme_repository.dart';
import 'local/settings_local_data_source.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  final SettingsLocalDataSource _localDataSource;

  ThemeRepositoryImpl(this._localDataSource);

  @override
  Future<bool> setDarkMode() {
    return _localDataSource.setDarkMode();
  }

  @override
  Future<bool> setLightMode() {
    return _localDataSource.setLightMode();
  }

  @override
  bool isDarkMode() {
    return _localDataSource.isDarkMode();
  }
}
