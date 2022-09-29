// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';

import '../../../widget/ui/base_theme.dart';
import '../../domain/theme_repository.dart';

class ThemeViewModel with ChangeNotifier {
  late ThemeRepository _repository;
  bool _isLightMode = false;
  bool get isLightMode => _isLightMode;
  set isLightMode(bool value) {
    _isLightMode = value;
  }

  Color? primaryColor;

  late ThemeData? _userTheme;
  ThemeData? get userTheme => _userTheme;
  set userTheme(ThemeData? value) {
    _userTheme = value;
    notifyListeners();
  }

  set isLightModeNotify(bool value) {
    isLightMode = value;
    notifyListeners();
  }

  update(ThemeRepository repository) {
    _repository = repository;
  }

  void setInitialTheme() {
    final result = _repository.isDarkMode();
    _isLightMode = result;
    if (isLightMode) {
      _userTheme = MyAppTheme.getLightMode(primaryColor);
    } else {
      _userTheme = MyAppTheme.getDarkMode(primaryColor);
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
