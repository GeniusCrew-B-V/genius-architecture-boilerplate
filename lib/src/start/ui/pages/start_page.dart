import 'package:baseproject/i18n/translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../resources/res.dart';
import '../../../base/widget/models/tutorial_widget_model.dart';
import '../../../base/widget/ui/tutorial_widget.dart';
import '../viewmodel/start_page_view_model_main.dart';
import '../widgets/start_app_bar.dart';

class StartPage extends StatelessWidget {
  final StartPageViewModelMain viewModel;

  StartPage(this.viewModel);

  final List<TutorialWidgetModel> myTutorialWidgets = [
    TutorialWidgetModel(
      imagePath: ImageSrc.illustrationOne,
      title: translation.tutorial.tutorialFirstMessageTitle,
      description: translation.tutorial.tutorialFirstMessageDescription,
    ),
    TutorialWidgetModel(
      imagePath: ImageSrc.illustrationTwo,
      title: translation.tutorial.tutorialSecondMessageTitle,
      description: translation.tutorial.tutorialSecondMessageDescription,
    ),
    TutorialWidgetModel(
      imagePath: ImageSrc.illustrationThree,
      title: translation.tutorial.tutorialThirdMessageTitle,
      description: translation.tutorial.tutorialThirdMessageDescription,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<StartPageViewModelMain>(
      context,
      listen: false,
    ).showSnackBarInStartPage = (message) => _showSnackbar(context, message);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.padding),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: AppBar().preferredSize.height,
                child: StartAppBar(),
              ),
            ),
            TutorialWidget(
              models: myTutorialWidgets,
              onPlaceHoldersPressed: (val) => viewModel.onPlaceholderClick(val),
              currentPlaceholder: viewModel.currentPlaceholderForTutorial,
              onEnd: viewModel.nextTutorialState,
            ),
            SizedBox(height: Sizes.padding)
          ],
        ),
      ),
    );
  }
}

void _showSnackbar(BuildContext context, String message) {
  if (message.isNotEmpty) {
    SnackBar snackBar = SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
