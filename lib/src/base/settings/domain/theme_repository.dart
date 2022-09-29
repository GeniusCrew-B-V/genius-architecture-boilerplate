abstract class ThemeRepository {
  Future<bool> setDarkMode();
  Future<bool> setLightMode();
  bool isDarkMode();
}
