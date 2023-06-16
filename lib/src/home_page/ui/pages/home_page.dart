import 'package:baseproject/src/start/ui/widgets/start_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../i18n/translations.dart';
import '../../../../resources/res.dart';
import '../viewmodel/home_page_view_model_main.dart';
import '../widget/home_card.dart';

class HomePage extends StatefulWidget {
  final HomePageViewModelMain viewModel;
  final Future<bool> Function()? onPop;

  const HomePage({
    required this.viewModel,
    required this.onPop,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  void _showSnackBar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      SnackBar snackBar = SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.viewModel.showSnackBar = (message) => _showSnackBar(context, message);
    return WillPopScope(
      onWillPop: widget.onPop,
      child: Scaffold(
        body: SafeArea(
            child: ListView(
          children: [
            const SizedBox(
              height: Sizes.paddingM,
            ),
            StartAppBar(),
            const SizedBox(
              height: Sizes.paddingM,
            ),
            Text(
              "${translation.homePage.welcome} ${widget.viewModel.baseViewModel.userModel?.name ?? ""}!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: Sizes.padding,
            ),
            Text(
              translation.homePage.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Sizes.paddingL,
            ),
            Text(
              translation.homePage.subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Sizes.paddingM,
            ),
            HomeCard(model: widget.viewModel.fakeModels[0]),
            HomeCard(model: widget.viewModel.fakeModels[1]),
            HomeCard(model: widget.viewModel.fakeModels[2]),
            HomeCard(model: widget.viewModel.fakeModels[3]),
          ],
        )),
      ),
    );
  }
}
