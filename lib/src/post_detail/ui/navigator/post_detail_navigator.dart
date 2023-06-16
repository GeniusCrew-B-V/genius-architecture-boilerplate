import 'package:baseproject/src/base/widget/ui/custom_navigator_pop_scope.dart';
import 'package:baseproject/src/post_detail/di/post_detail_providers.dart';
import 'package:baseproject/src/post_detail/ui/model/post_detail_navigation_state.dart';
import 'package:baseproject/src/post_detail/ui/pages/post_detail.dart';
import 'package:baseproject/src/post_detail/ui/viewmodel/post_detail_view_model_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _postDetailNavigationKey = GlobalKey<NavigatorState>();

class PostDetailNavigator extends StatefulWidget {
  final Future<bool> Function()? onMainPop;
  final String postId;

  const PostDetailNavigator({required this.onMainPop, required this.postId});

  @override
  _PostDetailNavigatorState createState() => _PostDetailNavigatorState();
}

class _PostDetailNavigatorState extends State<PostDetailNavigator> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        PostDetailViewModelMain viewModel = ref.watch(postDetailViewModelProvider);
        viewModel.postId = widget.postId;
        return CustomNavigatorPopScope(
          navigatorStateKey: _postDetailNavigationKey,
          pages: [
            MaterialPage(
              child: PostDetail(
                viewModel: viewModel,
                onPop: widget.onMainPop,
              ),
            ),
          ],
          onPopPage: (route, result) {
            viewModel.postDetailNavigationState =
                PostDetailNavigationState.none;
            return false;
          },
        );
      },
    );
  }
}
