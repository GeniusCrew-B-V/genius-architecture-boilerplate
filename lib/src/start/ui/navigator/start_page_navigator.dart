import 'package:baseproject/src/base/analytics/google_analytics_constants.dart';
import 'package:baseproject/src/signup/ui/navigator/signup_navigator.dart';
import 'package:baseproject/src/start/ui/pages/access_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base/analytics/google_analytics.dart';
import '../../../base/base_navigation/ui/navigator/base_navigator.dart';
import '../../../base/widget/ui/custom_navigator_pop_scope.dart';
import '../../../login/ui/navigator/login_navigator.dart';
import '../model/start_page_navigator_state.dart';
import '../pages/intro_page.dart';
import '../pages/splash_screen_page.dart';
import '../pages/start_page.dart';
import '../viewmodel/start_page_view_model_main.dart';

final _startPageNavigationKey = GlobalKey<NavigatorState>();

class StartPageNavigator extends StatelessWidget {
  StartPageNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StartPageViewModelMain>(
      builder: (context, viewModel, child) {
        GoogleAnalytics analytics = Provider.of<GoogleAnalytics>(
          context,
          listen: false,
        );
        if (viewModel.navigationState == StartPageNavigationState.startPage) {
          analytics.setCurrentScreen(GAnalyticsPage.START_PAGE);
        } else if (viewModel.navigationState == StartPageNavigationState.intro) {
          analytics.setCurrentScreen(GAnalyticsPage.INTRO);
        } else if (viewModel.navigationState == StartPageNavigationState.loginPage) {
          analytics.setCurrentScreen(GAnalyticsPage.LOGIN_PAGE);
        }
        return CustomNavigatorPopScope(
          navigatorStateKey: _startPageNavigationKey,
          pages: [
            //This is just for the presentation for a correct use, we consider using a proper splash screen
            MaterialPage(
              key: ValueKey('IntroPage'),
              child: IntroPage(viewModel),
            ),
            if (viewModel.navigationState == StartPageNavigationState.startPage)
              MaterialPage(
                key: ValueKey('StartPage'),
                child: StartPage(viewModel),
              ),
            if (viewModel.navigationState == StartPageNavigationState.homePage)
              MaterialPage(
                key: ValueKey('BaseNavigator'),
                child: BaseNavigator(),
              ),
            if (viewModel.navigationState == StartPageNavigationState.accessPage)
              MaterialPage(
                key: ValueKey('AccessPage'),
                child: AccessPage(viewModel, onPop: () => viewModel.navigationState = StartPageNavigationState.startPage),
              ),
            if (viewModel.navigationState == StartPageNavigationState.loginPage)
              MaterialPage(
                key: ValueKey('LoginPage'),
                child: LoginNavigator(onMainPop: () => viewModel.navigationState = StartPageNavigationState.accessPage),
              ),
            if (viewModel.navigationState == StartPageNavigationState.signUpPage)
              MaterialPage(
                key: ValueKey('SignUpPage'),
                child: SignupNavigator(onMainPop: () {
                  viewModel.navigationState = StartPageNavigationState.accessPage;
                }),
              ),
            if (viewModel.navigationState == StartPageNavigationState.splashScreen)
              MaterialPage(
                key: ValueKey('SplashScreenPage'),
                child: SplashScreenPage(),
              ),
          ],
          onPopPage: (route, result) {
            viewModel.navigationState = StartPageNavigationState.startPage;
            return false;
          },
        );
      },
    );
  }
}
