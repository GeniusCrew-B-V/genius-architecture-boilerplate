import 'package:baseproject/src/post_detail/ui/navigator/post_detail_navigator.dart';
import 'package:baseproject/src/updates/ui/pages/updates_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../base/widget/ui/custom_navigator_pop_scope.dart';
import '../../di/updates_page_providers.dart';
import '../model/updates_page_navigation_state.dart';
import '../viewmodel/updates_page_view_model_main.dart';

final _updatesPageNavigationKey = GlobalKey<NavigatorState>();

class UpdatesPageNavigator extends StatefulWidget {
  final Future<bool> Function()? onMainPop;

  const UpdatesPageNavigator({
    required this.onMainPop,
  });

  @override
  _UpdatesPageNavigatorState createState() => _UpdatesPageNavigatorState();
}

class _UpdatesPageNavigatorState extends State<UpdatesPageNavigator> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        UpdatesPageViewModelMain viewModel = ref.watch(updatesViewModelProvider);
        return CustomNavigatorPopScope(
          navigatorStateKey: _updatesPageNavigationKey,
          pages: [
            MaterialPage(
              child: UpdatesPage(
                viewModel: viewModel,
                onPop: widget.onMainPop,
              ),
            ),
            if (viewModel.updatesNavigationState == UpdatesPageNavigationState.postDetailsPage)
              MaterialPage(
                child: PostDetailNavigator(
                    postId: viewModel.postId,
                    onMainPop: () {
                      viewModel.updatesNavigationState = UpdatesPageNavigationState.baseUpdatesPage;
                      return Future.value(true);
                    }),
              ),
          ],
          onPopPage: (route, result) {
            viewModel.updatesNavigationState = UpdatesPageNavigationState.baseUpdatesPage;
            return false;
          },
        );
      },
    );
  }
}
