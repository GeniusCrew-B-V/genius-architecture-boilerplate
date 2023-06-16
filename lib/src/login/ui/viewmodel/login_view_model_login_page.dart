part of 'login_view_model_shared.dart';

mixin LoginViewModelLoginPage on LoginViewModelShared {
  // **************** FORM VARIABLES **********************
  // ******************************************************
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgotPwdFormKey = GlobalKey<FormState>();

  // ******************************************************

  // ***************** Show password **********************
  // ******************************************************
  bool _showPassword = true;

  bool get showPassword => _showPassword;

  set showPassword(bool newValue) {
    _showPassword = newValue;
    notifyListeners();
  }

  onShowPasswordPressed() {
    showPassword = !showPassword;
  }

  // ******************************************************

  // ******************** Actions *************************
  // ******************************************************
  Future onLoginClick() async {
    showPageLoader = true;
    notifyListeners();
    if (loginFormKey.currentState!.validate()) {
      try {
        LoginResponseModel resp = await loginRepository.loginUser(email.text, password.text);
        tokenRepository.saveToken(resp.token, resp.refreshToken, resp.timeout);
        loginNavigationState = LoginNavigationState.baseNavigator;
      } on LoginException catch (e) {
        print(e);
        if (e == LoginException.userNotFound) {
          showSnackBar(translation.loginPage.noUserFoundForThisEmail);
        } else if (e == LoginException.wrongPassword) {
          showSnackBar(translation.loginPage.wrongPasswordForThisUser);
        } else if (e == LoginException.emailNotVerified) {
          showSnackBar(translation.loginPage.notVerifiedEmail);
        } else if (e == LoginException.tooManyRequest) {
          showSnackBar(translation.loginPage.tooManyAccessTempt);
        } else
          showSnackBar(translation.generic.genericError);
      } catch (e) {
        print(e);
        showSnackBar(translation.generic.genericError);
      }
    }
    showPageLoader = false;
    notifyListeners();
  }

  Future onForgotPwdUserClick() async {
    showPageLoader = true;
    notifyListeners();
    String message = translation.loginPage.errorInSendingNewPassword;
    try {
      if (forgotPwdFormKey.currentState!.validate()) {
        try {
          //TODO implement sendPasswordResetEmail
          /*await loginRepository.sendPasswordResetEmail(
            email: forgotPwdEmail.text,
          );*/
          message = translation.loginPage.messageInSendingNewPassword;
        } catch (e) {
          if (e.toString().contains('user-not-found')) {
            message = translation.loginPage.noUserFoundForRecoverPassword;
            print(message);
          } else
            log('E.CODE: ' + e.toString());
        }
        showSnackBar(message);
      }
    } catch (e) {
      print(e);
    }
    forgotPwdEmail = TextEditingController();
    showPageLoader = false;
    notifyListeners();
  }
}
