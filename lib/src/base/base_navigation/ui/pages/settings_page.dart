import 'package:flutter/material.dart';

import '../../../../../i18n/translations.dart';
import '../../../../../resources/res.dart';
import '../../../../profile_page/ui/widget/settings_tile_switch.dart';
import '../../../widget/ui/app_bar_title.dart';
import '../viewmodel/base_view_model_main.dart';

class SettingsPage extends StatelessWidget {
  final Function()? onPop;
  final BaseViewModelMain viewModel;

  const SettingsPage({
    Key? key,
    this.onPop,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onPop!(),
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: translation.profilePage.settings),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: onPop,
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.padding),
              child: SettingsTileSwitch(
                icon: Icons.dark_mode,
                title: translation.profilePage.darkTheme,
                subtitle: translation.profilePage.darkThemeDescription,
                switchValue: viewModel.darkTheme ?? false,
                onSwitchValueChange: viewModel.onThemeDarkSwitch,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
