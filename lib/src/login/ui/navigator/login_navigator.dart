import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base/base_navigation/ui/navigator/base_navigator.dart';
import '../../../base/widget/ui/custom_navigator_pop_scope.dart';
import '../../../signup/ui/navigator/signup_navigator.dart';
import '../../di/login_providers.dart';
import '../model/login_navigation_state.dart';
import '../pages/login_page.dart';
import '../viewmodel/login_view_model_main.dart';

class LoginNavigator extends StatelessWidget {
  final Function onMainPop;

  const LoginNavigator({Key? key, required this.onMainPop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: loginProviders,
      child: Consumer<LoginViewModelMain>(
        builder: (_, viewModel, __) {
          return CustomNavigatorPopScope(
            navigatorStateKey: viewModel.loginNavigationKey,
            pages: [
              MaterialPage(
                child: LoginPage(
                  key: ValueKey('LoginPage'),
                  viewModel: viewModel,
                  onPop: onMainPop,
                ),
              ),
              if (viewModel.loginNavigationState == LoginNavigationState.signupPage)
                MaterialPage(
                  child: SignupNavigator(
                    key: ValueKey('SignupNavigator'),
                    onMainPop: () => viewModel.loginNavigationState = LoginNavigationState.startPage,
                  ),
                ),
              if (viewModel.loginNavigationState == LoginNavigationState.baseNavigator)
                MaterialPage(
                  child: BaseNavigator(key: ValueKey('BaseNavigator')),
                ),
            ],
            onPopPage: (route, result) {
              viewModel.loginNavigationState = LoginNavigationState.startPage;
              return false;
            },
          );
        },
      ),
    );
  }
}
