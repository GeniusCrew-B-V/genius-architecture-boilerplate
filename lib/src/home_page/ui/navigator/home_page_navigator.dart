import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../base/widget/ui/custom_navigator_pop_scope.dart';
import '../../di/home_page_providers.dart';
import '../model/home_page_navigation_state.dart';
import '../pages/home_page.dart';
import '../viewmodel/home_page_view_model_main.dart';

final _homePageNavigationKey = GlobalKey<NavigatorState>();

class HomePageNavigator extends StatefulWidget {
  final Future<bool> Function()? onMainPop;

  const HomePageNavigator({
    required this.onMainPop,
  });

  @override
  _HomePageNavigatorState createState() => _HomePageNavigatorState();
}

class _HomePageNavigatorState extends State<HomePageNavigator> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        HomePageViewModelMain viewModel = ref.watch(homePageViewModelProvider);
        return CustomNavigatorPopScope(
          navigatorStateKey: _homePageNavigationKey,
          pages: [
            MaterialPage(
              child: HomePage(
                viewModel: viewModel,
                onPop: widget.onMainPop,
              ),
            ),
          ],
          onPopPage: (route, result) {
            viewModel.homeNavigationState =
                HomePageNavigationState.baseHomePage;
            return false;
          },
        );
      },
    );
  }
}
