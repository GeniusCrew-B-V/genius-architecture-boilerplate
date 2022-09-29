part of 'login_view_model_shared.dart';

mixin LoginViewModelNavigation on LoginViewModelShared {
  final loginNavigationKey = GlobalKey<NavigatorState>();
  onNewUserClick() {
    loginNavigationState = LoginNavigationState.signupPage;
  }
}
