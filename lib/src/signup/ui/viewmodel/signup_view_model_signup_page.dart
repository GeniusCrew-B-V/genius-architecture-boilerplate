part of 'signup_view_model_shared.dart';

mixin SignupViewModelSignupPage on SignupViewModelShared {
  // **************** FORM VARIABLES **********************
  // ******************************************************

  final FocusNode emailFocus = FocusNode();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode nameFocus = FocusNode();
  final FocusNode surnameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode bornDateFocus = FocusNode();
  final FocusNode weightFocus = FocusNode();
  final FocusNode heightFocus = FocusNode();

  static const _maxLength = 40;
  static const _maxLengthEmail = 100;
  static const _placeHolder = r'@@';

  // ******************************************************

  // **************** Privacy policy **********************
  // ******************************************************

  // ******************** acceptedPoint2A **************************
  Color privacyPolicyPoint2AColor = AppColors.paleGrey;
  bool _isPrivacyPolicyPoint2AAccepted = false;

  bool get isPrivacyPolicyPoint2AAccepted => _isPrivacyPolicyPoint2AAccepted;

  set isPrivacyPolicyPoint2AAccepted(bool newValue) {
    _isPrivacyPolicyPoint2AAccepted = newValue;
    notifyListeners();
  }

  onPrivacyPolicyPoint2APressed(BuildContext context, bool newVal) {
    if (newVal) {
      privacyPolicyPoint2AColor = Theme.of(context).primaryColor;
    } else
      privacyPolicyPoint2AColor = AppColors.paleGrey;
    isPrivacyPolicyPoint2AAccepted = newVal;
  }

  // ******************** acceptedPoint2B0 **************************

  Color privacyPolicyPoint2B0Color = AppColors.paleGrey;
  bool _isPrivacyPolicyPoint2B0Accepted = false;

  bool get isPrivacyPolicyPoint2B0Accepted => _isPrivacyPolicyPoint2B0Accepted;

  set isPrivacyPolicyPoint2B0Accepted(bool newValue) {
    _isPrivacyPolicyPoint2B0Accepted = newValue;
    notifyListeners();
  }

  onPrivacyPolicyPoint2B0Pressed(BuildContext context, bool newVal) {
    if (newVal) {
      privacyPolicyPoint2B0Color = Theme.of(context).primaryColor;
    } else
      privacyPolicyPoint2B0Color = AppColors.paleGrey;
    isPrivacyPolicyPoint2B0Accepted = newVal;
  }

  // ******************** acceptedPoint2B1 **************************
  Color privacyPolicyPoint2B1Color = AppColors.paleGrey;
  bool _isPrivacyPolicyPoint2B1Accepted = false;

  bool get isPrivacyPolicyPoint2B1Accepted => _isPrivacyPolicyPoint2B1Accepted;

  set isPrivacyPolicyPoint2B1Accepted(bool newValue) {
    _isPrivacyPolicyPoint2B1Accepted = newValue;
    notifyListeners();
  }

  onPrivacyPolicyPoint2B1Pressed(BuildContext context, bool newVal) {
    if (newVal) {
      privacyPolicyPoint2B1Color = Theme.of(context).primaryColor;
    } else
      privacyPolicyPoint2B1Color = AppColors.paleGrey;
    isPrivacyPolicyPoint2B1Accepted = newVal;
  }

  // ******************** acceptedPoint2B2 **************************

  Color privacyPolicyPoint2B2Color = AppColors.paleGrey;
  bool _isPrivacyPolicyPoint2B2Accepted = false;

  bool get isPrivacyPolicyPoint2B2Accepted => _isPrivacyPolicyPoint2B2Accepted;

  set isPrivacyPolicyPoint2B2Accepted(bool newValue) {
    _isPrivacyPolicyPoint2B2Accepted = newValue;
    notifyListeners();
  }

  onPrivacyPolicyPoint2B2Pressed(BuildContext context, bool newVal) {
    if (newVal) {
      privacyPolicyPoint2B2Color = Theme.of(context).primaryColor;
    } else
      privacyPolicyPoint2B2Color = AppColors.paleGrey;
    isPrivacyPolicyPoint2B2Accepted = newVal;
  }

  // ******************** acceptedPoint2B3 **************************

  Color privacyPolicyPoint2B3Color = AppColors.paleGrey;
  bool _isPrivacyPolicyPoint2B3Accepted = false;

  bool get isPrivacyPolicyPoint2B3Accepted => _isPrivacyPolicyPoint2B3Accepted;

  set isPrivacyPolicyPoint2B3Accepted(bool newValue) {
    _isPrivacyPolicyPoint2B3Accepted = newValue;
    notifyListeners();
  }

  onPrivacyPolicyPoint2B3Pressed(BuildContext context, bool newVal) {
    if (newVal) {
      privacyPolicyPoint2B3Color = Theme.of(context).primaryColor;
    } else
      privacyPolicyPoint2B3Color = AppColors.paleGrey;
    isPrivacyPolicyPoint2B3Accepted = newVal;
  }

  // *************** Terms And Conditions *****************
  // ******************************************************

  Color termsAndConditionsColor = AppColors.paleGrey;
  bool _isTermsAndConditionsAccepted = false;

  bool get isTermsAndConditionsAccepted => _isTermsAndConditionsAccepted;

  set isTermsAndConditionsAccepted(bool newValue) {
    _isTermsAndConditionsAccepted = newValue;
    notifyListeners();
  }

  onTermsAndConditionsPressed(BuildContext context, bool newVal) {
    if (newVal) {
      termsAndConditionsColor = Theme.of(context).primaryColor;
    } else
      termsAndConditionsColor = AppColors.paleGrey;
    isTermsAndConditionsAccepted = newVal;
  }

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

  bool _showConfirmPassword = true;

  bool get showConfirmPassword => _showConfirmPassword;

  set showConfirmPassword(bool newValue) {
    _showConfirmPassword = newValue;
    notifyListeners();
  }

  onShowConfirmPasswordPressed() {
    showConfirmPassword = !showConfirmPassword;
  }

  // ******************************************************

  // ****************** Validators ************************
  // ******************************************************
  String? validateEmail() {
    if (email.text.isEmpty) {
      emailFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (email.text.length > _maxLengthEmail) {
      emailFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(_placeHolder), _maxLengthEmail.toString());
    } else if (email.text.contains(" ")) {
      return translation.textFieldValidations.wrongCharacters;
    } else if (!isEmail(email.text) && email.text.isNotEmpty) {
      emailFocus.requestFocus();
      return translation.textFieldValidations.wrongCharacters;
    } else
      return null;
  }

  String? validateUsername() {
    if (username.text.isEmpty) {
      usernameFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (username.text.length > _maxLength) {
      usernameFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(_placeHolder), _maxLength.toString());
    } else
      return null;
  }

  String? validatePassword() {
    if (password.text.isEmpty) {
      passwordFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (password.text.length > _maxLength) {
      passwordFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(_placeHolder), _maxLength.toString());
    } else
      return null;
  }

  String? validateName() {
    if (name.text.isEmpty) {
      nameFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (name.text.length > _maxLength) {
      nameFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(_placeHolder), _maxLength.toString());
    } else
      return null;
  }

  String? validateSurname() {
    if (surname.text.isEmpty) {
      surnameFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (surname.text.length > _maxLength) {
      surnameFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(_placeHolder), _maxLength.toString());
    } else
      return null;
  }

  String? validateBirthDate() {
    if (bornDate.text.isEmpty) {
      bornDateFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (bornDate.text.length > _maxLength) {
      bornDateFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(_placeHolder), _maxLength.toString());
    } else
      return null;
  }

  String? validateHeight() {
    if (height.text.isEmpty) {
      heightFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (height.text.length > _maxLength) {
      heightFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(_placeHolder), _maxLength.toString());
    } else
      return null;
  }

  String? validateWeight() {
    if (weight.text.isEmpty) {
      weightFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (weight.text.length > _maxLength) {
      weightFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(_placeHolder), _maxLength.toString());
    } else
      return null;
  }

  // ******************************************************

  // ******************** Actions *************************
  // ******************************************************

  Future onSignupClick() async {
    showPageLoader = true;
    notifyListeners();
    if (isTermsAndConditionsAccepted && isPrivacyPolicyPoint2AAccepted && _isPrivacyPolicyPoint2B0Accepted) {
      try {
        await signupRepository
            .signupUser(SignupPageUserRequestModel(
          username: username.text,
          email: email.text,
          name: name.text,
          surname: surname.text,
          password: password.text,
          acceptedPoint2A: isPrivacyPolicyPoint2AAccepted,
          acceptedPoint2B0: isPrivacyPolicyPoint2B0Accepted,
          acceptedPoint2B1: isPrivacyPolicyPoint2B1Accepted,
          acceptedPoint2B2: isPrivacyPolicyPoint2B2Accepted,
          acceptedPoint2B3: isPrivacyPolicyPoint2B3Accepted,
        ))
            .then((value) {
          signupNavigationState = SignupNavigationState.confirmPage;
        });
      } catch (e) {
        if (e == SignupException.weakPassword) {
          showSnackBar(translation.textFieldValidations.weakPassword);
        } else if (e == SignupException.emailAlreadyInUse) {
          showSnackBar(translation.textFieldValidations.emailAlreadyInUse);
        } else if (e == SignupException.invalidEmail) {
          showSnackBar(translation.textFieldValidations.invalidEmail);
        } else
          showSnackBar(translation.generic.genericError);
      }
    } else {
      if (!isPrivacyPolicyPoint2AAccepted) privacyPolicyPoint2AColor = AppColors.red;
      if (!isPrivacyPolicyPoint2B0Accepted) privacyPolicyPoint2B0Color = AppColors.red;
      notifyListeners();
      if (!isTermsAndConditionsAccepted) termsAndConditionsColor = AppColors.red;
      notifyListeners();
    }
    showPageLoader = false;
    notifyListeners();
  }
}
