import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base/widget/ui/custom_navigator_pop_scope.dart';
import '../../../login/ui/navigator/login_navigator.dart';
import '../../di/signup_providers.dart';
import '../model/signup_navigation_state.dart';
import '../pages/signup_confirm_page.dart';
import '../pages/signup_page.dart';
import '../pages/signup_privacy_policy_page.dart';
import '../viewmodel/signup_view_model_main.dart';

final _signupNavigationKey = GlobalKey<NavigatorState>();

class SignupNavigator extends StatelessWidget {
  final Function onMainPop;

  const SignupNavigator({Key? key, required this.onMainPop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: signupProviders,
      child: Consumer<SignipViewModelMain>(
        builder: (_, viewModel, __) {
          return CustomNavigatorPopScope(
            navigatorStateKey: _signupNavigationKey,
            pages: [
              MaterialPage(
                child: SignupPage(
                  key: ValueKey('SignupPage'),
                  viewModel: viewModel,
                  onPop: onMainPop,
                ),
              ),
              if (viewModel.signupNavigationState == SignupNavigationState.confirmPage)
                MaterialPage(
                  child: SignupConfirmPage(
                    key: ValueKey('SignupConfirmPage'),
                    viewModel: viewModel,
                    onPop: onMainPop,
                  ),
                ),
              if (viewModel.signupNavigationState == SignupNavigationState.privacyPolicyPage)
                MaterialPage(
                  child: SignupPrivacyPolicyPage(
                    key: ValueKey('PrivacyPolicyPage'),
                    viewModel: viewModel,
                    onPop: () => viewModel.signupNavigationState = SignupNavigationState.startPage,
                  ),
                ),
              if (viewModel.signupNavigationState == SignupNavigationState.loginPage)
                MaterialPage(
                  child: LoginNavigator(
                    key: ValueKey('LoginNavigator2'),
                    onMainPop: onMainPop,
                  ),
                ),
            ],
            onPopPage: (route, result) {
              viewModel.signupNavigationState = SignupNavigationState.startPage;
              return false;
            },
          );
        },
      ),
    );
  }
}
