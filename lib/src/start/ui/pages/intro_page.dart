import 'package:flutter/material.dart';
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
