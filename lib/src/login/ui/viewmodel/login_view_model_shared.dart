import 'dart:developer';

import 'package:baseproject/i18n/translations.dart';
import 'package:flutter/material.dart';

import '../../../base/token/domain/token_repository.dart';
import '../../domain/login_repository.dart';
import '../../domain/model/login_exception.dart';
import '../../domain/model/login_response_model.dart';
import '../model/login_navigation_state.dart';

part 'login_view_model_login_page.dart';
part 'login_view_model_navigation.dart';

mixin LoginViewModelShared on ChangeNotifier {
  late LoginRepository loginRepository;
  late TokenRepository tokenRepository;
  late Function(String) showSnackBar;
  bool _showPageLoader = false;
  bool get showPageLoader => _showPageLoader;
  final FocusNode forgotPwdEmailFocus = FocusNode();

  set showPageLoader(bool val) {
    _showPageLoader = val;
    notifyListeners();
  }

  void update(LoginRepository repository, TokenRepository tknRepository) {
    loginRepository = repository;
    tokenRepository = tknRepository;
  }

  // *************** FORMS Controller *********************
  // ******************************************************

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController forgotPwdEmail = TextEditingController();

  // ******************************************************

  // ****************** NAVIGATION ************************
  // ******************************************************
  LoginNavigationState _loginNavigationState = LoginNavigationState.startPage;

  LoginNavigationState get loginNavigationState => _loginNavigationState;

  set loginNavigationState(LoginNavigationState newState) {
    _loginNavigationState = newState;
    notifyListeners();
    // ******************************************************
  }
}
