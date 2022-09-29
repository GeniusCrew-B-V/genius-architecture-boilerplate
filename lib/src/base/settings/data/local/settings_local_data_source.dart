abstract class SettingsLocalDataSource {
  Future<bool> setDarkMode();
  Future<bool> setLightMode();
  bool isDarkMode();
}
