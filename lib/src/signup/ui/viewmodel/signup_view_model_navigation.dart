part of 'signup_view_model_shared.dart';

mixin SignupViewModelNavigation on SignupViewModelShared {
  onContinueClick() {
    if (signupFormKey.currentState!.validate()) {
      signupNavigationState = SignupNavigationState.privacyPolicyPage;
    }
  }
}
