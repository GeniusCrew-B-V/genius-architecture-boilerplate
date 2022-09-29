part of 'profile_page_view_model_shared.dart';

mixin ProfilePageViewModelMainPage on ProfilePageViewModelShared {
  // ******************************************************

  // ******************** Actions *************************
  // ******************************************************

  Future onSaveClick() async {
    showPageLoader = true;
    notifyListeners();
    if (userFormKey.currentState != null && userFormKey.currentState!.validate()) {
      await _repository
          .saveUserChanges(ProfilePageUserRequestModel(
        username: username.text,
        name: name.text,
        surname: surname.text,
        city: city.text,
        email: email.text,
      ))
          .then((value) {
        baseViewModel.userModel = value;
      }).catchError((e) {
        if (showSnackBar != null) showSnackBar!(translation.generic.genericError);
      });
    }
    showPageLoader = false;
    notifyListeners();
  }

  bool _showConfirmNewPassword = true;

  bool get showConfirmNewPassword => _showConfirmNewPassword;

  set showConfirmNewPassword(bool newValue) {
    _showConfirmNewPassword = newValue;
    notifyListeners();
  }

  onShowConfirmNewPasswordPressed() {
    showConfirmNewPassword = !showConfirmNewPassword;
  }

  bool _showNewPassword = true;

  bool get showNewPassword => _showNewPassword;

  set showNewPassword(bool newValue) {
    _showNewPassword = newValue;
    notifyListeners();
  }

  onShowNewPasswordPressed() {
    showNewPassword = !showNewPassword;
  }

  bool _showOldPassword = true;

  bool get showOldPassword => _showOldPassword;

  set showOldPassword(bool newValue) {
    _showOldPassword = newValue;
    notifyListeners();
  }

  onShowOldPasswordPressed() {
    showOldPassword = !showOldPassword;
  }
}
