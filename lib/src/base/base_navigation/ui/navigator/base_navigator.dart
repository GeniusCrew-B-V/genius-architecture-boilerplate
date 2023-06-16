import 'package:baseproject/src/base/base_navigation/di/base_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../home_page/ui/navigator/home_page_navigator.dart';
import '../../../../profile_page/ui/navigator/profile_page_navigator.dart';
import '../../../../updates/ui/navigator/updates_page_navigator.dart';
import '../../../widget/ui/custom_navigator_pop_scope.dart';
import '../pages/base_page.dart';
import '../viewmodel/base_view_model_main.dart';

final _baseNavigationKey = GlobalKey<NavigatorState>();

class BaseNavigator extends ConsumerWidget {
  final Function()? onMainPop;

  const BaseNavigator({
    Key? key,
    this.onMainPop,
  }) : super(key: key);

  onBasePagePop(
    BaseViewModelMain viewModel,
  ) {
    viewModel.bottomMenuIndex = 0;
  }

  List<Page<dynamic>> getPages(
    BuildContext context,
    BaseViewModelMain viewModel,
  ) {
    return [
      MaterialPage(
        child: ProfilePageNavigator(
          onMainPop: () async => onBasePagePop(viewModel),
        ),
      ),
      if (viewModel.bottomMenuIndex == 1)
        MaterialPage(
          child: UpdatesPageNavigator(
            onMainPop: () async => onBasePagePop(viewModel),
          ),
        ),
      if (viewModel.bottomMenuIndex == 2)
        MaterialPage(
          child: HomePageNavigator(
            onMainPop: () async => false,
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context, ref) {
    BaseViewModelMain viewModel = ref.watch(baseViewModelProvider);
    return BasePage(
      scaffoldKey: viewModel.basePageScaffoldKey,
      hideNavigationBar: viewModel.hideNavigationBar,
      body: CustomNavigatorPopScope(
        navigatorStateKey: _baseNavigationKey,
        pages: getPages(context, viewModel),
        onPopPage: (route, result) {
          viewModel.bottomMenuIndex = 0;
          return false;
        },
      ),
    );
  }
}
