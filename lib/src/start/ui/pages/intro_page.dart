import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../resources/res.dart';
import '../viewmodel/start_page_view_model_main.dart';

class IntroPage extends StatelessWidget {
  final StartPageViewModelMain viewModel;
  IntroPage(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          Provider.of<StartPageViewModelMain>(
            context,
            listen: false,
          ).showSnackBarInStartPage = (message) => _showSnackbar(context, message);
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageSrc.bigLogo, width: MediaQuery.of(context).size.width / 2),
                SizedBox(height: Sizes.paddingL),
                Image.asset(ImageSrc.splash, width: MediaQuery.of(context).size.width / 1.2),
              ],
            ),
          );
        },
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
