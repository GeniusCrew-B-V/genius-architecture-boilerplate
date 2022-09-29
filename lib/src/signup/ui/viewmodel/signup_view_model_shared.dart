import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../../../../i18n/translations.dart';
import '../../../../resources/res.dart';
import '../../domain/model/signup_exception.dart';
import '../../domain/model/signup_page_user_request_model.dart';
import '../../domain/signup_repository.dart';
import '../model/signup_navigation_state.dart';

part 'signup_view_model_navigation.dart';
part 'signup_view_model_second_page.dart';
part 'signup_view_model_signup_page.dart';

mixin SignupViewModelShared on ChangeNotifier {
  late SignupRepository signupRepository;
  late Function(String) showSnackBar;
  bool _showPageLoader = false;

  bool get showPageLoader => _showPageLoader;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  set showPageLoader(bool val) {
    _showPageLoader = val;
    notifyListeners();
  }

  void update(
    SignupRepository repository,
  ) {
    signupRepository = repository;
  }

  // ****************** NAVIGATION ************************
  // ******************************************************
  SignupNavigationState _signupNavigationState = SignupNavigationState.signupPage;

  SignupNavigationState get signupNavigationState => _signupNavigationState;

  set signupNavigationState(SignupNavigationState newState) {
    _signupNavigationState = newState;
    notifyListeners();
  }

  // *************** FORMS Controller *********************
  // ******************************************************

  TextEditingController email = TextEditingController();
  TextEditingController confirmEmail = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController bornDate = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  String gender = "M";

// ******************************************************

}
