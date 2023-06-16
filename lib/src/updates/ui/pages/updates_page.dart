import 'package:baseproject/src/base/widget/ui/paginated_list.dart';
import 'package:baseproject/src/base/widget/ui/post_card.dart';
import 'package:baseproject/src/updates/ui/viewmodel/updates_page_view_model_main.dart';
import 'package:flutter/material.dart';

import '../../../../i18n/translations.dart';
import '../../../../resources/res.dart';
import '../../../base/widget/ui/custom_circular_progress_indicator.dart';
import '../../../post_detail/ui/navigator/post_detail_navigator.dart';

class UpdatesPage extends StatefulWidget {
  final UpdatesPageViewModelMain viewModel;
  final Future<bool> Function()? onPop;

  const UpdatesPage({
    required this.viewModel,
    required this.onPop,
  });

  @override
  _UpdatesPageState createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {
  ScrollController scrollControllerUpdates = ScrollController();
  ScrollController scrollControllerUsers = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  void _showSnackbar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      SnackBar snackBar = SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.viewModel.showSnackBar = (message) => _showSnackbar(context, message);
    return WillPopScope(
      onWillPop: widget.onPop,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      controller: scrollControllerUpdates,
                      children: [
                        const SizedBox(
                          height: Sizes.paddingM,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Sizes.padding),
                          child: Text(
                            translation.updatesPage.title,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge,
                          ),
                        ),
                        PaginatedList(
                          key: Key('PostsList'),
                          cardsLength: widget.viewModel.postsList.length,
                          initFunction: () => widget.viewModel.updatePosts(),
                          scrollNextPageFunc: () => widget.viewModel.scrollNextPagePosts(),
                          showPageLoader: widget.viewModel.showPageLoader,
                          maxCardsLenght: widget.viewModel.maxPostsNum,
                          externalScrollController: scrollControllerUpdates,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder:(context) =>PostDetailNavigator(
                                        postId: widget.viewModel.postsList[index].postId,
                                        onMainPop: () {
                                          Navigator.of(context).pop();
                                          //widget.viewModel.updatesNavigationState = UpdatesPageNavigationState.baseUpdatesPage;
                                          return Future.value(true);
                                        }),
                                  ));
                                },
                                child: PostCard(postModel: widget.viewModel.postsList[index]));
                          },
                        ),
                      ],
                    ))
              ],
            ),
            if (widget.viewModel.showPageLoader) CustomCircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
