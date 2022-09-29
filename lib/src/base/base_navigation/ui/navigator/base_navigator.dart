import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../home_page/ui/navigator/home_page_navigator.dart';
import '../../../../profile_page/ui/navigator/profile_page_navigator.dart';
import '../../../../updates/ui/navigator/updates_page_navigator.dart';
import '../../../widget/ui/custom_navigator_pop_scope.dart';
import '../../di/base_providers.dart';
import '../pages/base_page.dart';
import '../viewmodel/base_view_model_main.dart';

final _baseNavigationKey = GlobalKey<NavigatorState>();

class BaseNavigator extends StatelessWidget {
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
        child: HomePageNavigator(
          onMainPop: () async => false,
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
          child: ProfilePageNavigator(
            onMainPop: () async => onBasePagePop(viewModel),
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: baseProviders,
      child: Consumer<BaseViewModelMain>(
        builder: (_, viewModel, __) {
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
        },
      ),
    );
  }
}
