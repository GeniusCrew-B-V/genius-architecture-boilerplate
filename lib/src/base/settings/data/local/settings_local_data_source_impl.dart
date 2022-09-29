import 'package:shared_preferences/shared_preferences.dart';

import 'settings_local_data_source.dart';

class SettingsLocalDataSourceImpl extends SettingsLocalDataSource {
  final SharedPreferences _prefs;

  final String _darkMode = "darkMode";

  SettingsLocalDataSourceImpl(this._prefs);

  @override
  Future<bool> setDarkMode() async {
    final res = await _prefs.setBool(_darkMode, true);
    return res;
  }

  @override
  Future<bool> setLightMode() async {
    return await _prefs.setBool(_darkMode, false);
  }

  @override
  bool isDarkMode() {
    final bool? isDarkMode = _prefs.getBool(_darkMode);
    if (isDarkMode != null) {
      return !isDarkMode;
    } else if (isDarkMode == null) {
      return true;
    } else {
      return false;
    }
  }
}
