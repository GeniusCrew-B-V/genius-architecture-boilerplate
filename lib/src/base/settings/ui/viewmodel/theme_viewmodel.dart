import 'package:flutter/material.dart';

import '../../../widget/ui/base_theme.dart';
import '../../domain/theme_repository.dart';

class ThemeViewModel with ChangeNotifier {
  ThemeViewModel(this._repository);

  ThemeRepository _repository;
  bool _isLightMode = false;

  bool get isLightMode => _isLightMode;

  set isLightMode(bool value) {
    _isLightMode = value;
  }

  Color? primaryColor;

  ThemeData? _userTheme = MyAppTheme.getLightMode(null);

  ThemeData? get userTheme => _userTheme;

  set userTheme(ThemeData? value) {
    _userTheme = value;
    notifyListeners();
  }

  set isLightModeNotify(bool value) {
    isLightMode = value;
    notifyListeners();
  }

  bool setInitialThemeDone = false;

  void setInitialTheme() {
    if (!setInitialThemeDone) {
      final result = _repository.isDarkMode();
      _isLightMode = result;
      if (isLightMode) {
        _userTheme = MyAppTheme.getLightMode(primaryColor);
      } else {
        _userTheme = MyAppTheme.getDarkMode(primaryColor);
      }
      setInitialThemeDone = true;
    }
  }

  Future<void> setDarkTheme() async {
    await _repository.setDarkMode();
    userTheme = MyAppTheme.getDarkMode(primaryColor);
    isLightMode = false;
  }

  Future<void> setLightTheme() async {
    await _repository.setLightMode();
    userTheme = MyAppTheme.getLightMode(primaryColor);
    isLightMode = true;
  }

  bool getIfDarkMode() {
    return _repository.isDarkMode();
  }

  void updateThemeWithPrimaryColor(Color? newPrimaryColor) {
    primaryColor = newPrimaryColor;
    if (isLightMode) {
      userTheme = MyAppTheme.getLightMode(newPrimaryColor);
    } else {
      userTheme = MyAppTheme.getDarkMode(newPrimaryColor);
    }
  }
}
