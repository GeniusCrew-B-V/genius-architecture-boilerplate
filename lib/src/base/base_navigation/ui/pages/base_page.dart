import 'package:baseproject/src/base/base_navigation/di/base_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../i18n/translations.dart';
import '../../../../../resources/res.dart';
import '../../../widget/ui/custom_circular_progress_indicator.dart';
import '../model/base_navigation_state.dart';
import '../viewmodel/base_view_model_main.dart';

class BasePage extends ConsumerWidget {
  final Widget body;
  final Widget? endDrawer;
  final AppBar? appBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool hideNavigationBar;

  BasePage({
    required this.body,
    this.appBar,
    this.endDrawer,
    this.scaffoldKey,
    this.hideNavigationBar = false,
  });

  Widget _drawer(BaseViewModelMain viewModel, BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: Sizes.padding),
                Image.asset(ImageSrc.logo, height: Sizes.appBarLogoHeight),
                SizedBox(height: Sizes.padding),
              ],
            ),
            Column(
              children: [
                Divider(),
                ListTile(
                  title: Text(translation.profilePage.settings),
                  dense: true,
                  visualDensity: VisualDensity(vertical: -3),
                  // to compact
                  trailing: Icon(Icons.arrow_forward_ios, size: Sizes.listTileIcon),
                  onTap: () {
                    viewModel.baseNavigationSubPagesState = BaseNavigationSubPagesState.settingsPage;
                    scaffoldKey!.currentState!.openEndDrawer();
                  },
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(bottom: Sizes.padding),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text(translation.generic.logout),
                      onTap: () async {
                        viewModel.logOut();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BaseViewModelMain viewModel = ref.watch(baseViewModelProvider);

    return viewModel.hasLoadedUser
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: CustomCircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            key: scaffoldKey,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            endDrawer: endDrawer,
            drawer: _drawer(viewModel, context),
            appBar: null,
            bottomNavigationBar: AnimatedCrossFade(
              firstCurve: Curves.easeIn,
              secondCurve: Curves.easeOut,
              crossFadeState: hideNavigationBar ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              secondChild: Container(
                width: double.infinity,
                height: 0,
              ),
              firstChild: NavigationBar(
                selectedIndex: viewModel.bottomMenuIndex,
                onDestinationSelected: (i) => viewModel.bottomMenuIndex = i,
                destinations: [
                  NavigationDestination(
                    icon: FaIcon(FontAwesomeIcons.house),
                    label: translation.generic.home,
                  ),
                  NavigationDestination(
                    icon: FaIcon(FontAwesomeIcons.calendar),
                    label: translation.generic.updates,
                  ),
                  NavigationDestination(
                    icon: FaIcon(FontAwesomeIcons.solidUser),
                    label: translation.generic.profile,
                  ),
                ],
              ),
              duration: Duration(milliseconds: Sizes.standardAnimationDuration),
            ),
            body: body);
  }
}
