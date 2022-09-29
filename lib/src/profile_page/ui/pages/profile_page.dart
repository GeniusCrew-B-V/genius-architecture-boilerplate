import 'package:baseproject/src/profile_page/ui/widget/custom_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../i18n/translations.dart';
import '../../../../resources/res.dart';
import '../../../base/widget/ui/custom_circular_progress_indicator.dart';
import '../model/profile_page_navigation_state.dart';
import '../viewmodel/profile_page_view_model_main.dart';

class ProfilePage extends StatelessWidget {
  final ProfilePageViewModelMain viewModel;
  final Function()? onPop;

  const ProfilePage({
    required this.viewModel,
    this.onPop,
  });

  void _showSnackBar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      SnackBar snackBar = SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget _aboutMeSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Sizes.paddingXS,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: ListTile(
              onTap: () {
                viewModel.profileNavigationState = ProfilePageNavigationState.personalDataPage;
              },
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0,
              trailing: Icon(Icons.edit, color: Theme.of(context).primaryColor),
              title: Text(
                translation.profilePage.aboutMe,
                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Text(
            translation.profilePage.nameAndSurname,
            style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w400),
          ),
          Text(
            (viewModel.userModel.name ?? '') + ' ' + (viewModel.userModel.surname ?? ''),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBox(height: Sizes.paddingS),
          Text(
            translation.profilePage.phoneNumber,
            style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w400),
          ),
          Text(
            viewModel.userModel.phoneNumber ?? '',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBox(height: Sizes.paddingS),
          Text(
            "Email",
            style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w400),
          ),
          Text(
            viewModel.userModel.email ?? '',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBox(height: Sizes.paddingS),
        ],
      ),
    );
  }

  Widget drawer(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                title: Text(translation.profilePage.editPersonalData),
                onTap: () => viewModel.profileNavigationState = ProfilePageNavigationState.personalDataPage,
              ),
              Divider(),
              ListTile(
                title: Text(translation.profilePage.privacyPolicy),
                onTap: () async =>
                    await canLaunchUrlString("https://baseproject.com/privacy-policy/") ? await launchUrlString("https://baseproject.com/privacy-policy/") : throw 'Could not launch privacy policy',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Sizes.padding),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(translation.generic.logout),
                onTap: () async {
                  viewModel.logout();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    viewModel.showSnackBar = (message) => _showSnackBar(context, message);
    return WillPopScope(
      onWillPop: () => onPop!(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: viewModel.scaffoldKey,
        body: Builder(
          builder: (context) {
            viewModel.showSnackBar = (message) => _showSnackBar(context, message);
            return SafeArea(
              child: Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.only(
                      right: Sizes.padding,
                      left: Sizes.padding,
                      top: Sizes.paddingM,
                    ),
                    children: [
                      SizedBox(height: Sizes.padding),
                      _aboutMeSection(context),
                      SizedBox(height: Sizes.padding),
                      CustomTileWidget(text: translation.profilePage.settings, onPressed: () => viewModel.profileNavigationState = ProfilePageNavigationState.settingsPage),
                      SizedBox(height: Sizes.padding),
                      CustomTileWidget(text: translation.profilePage.resetPassword, onPressed: () => viewModel.profileNavigationState = ProfilePageNavigationState.changePwdPage),
                      SizedBox(height: Sizes.padding),
                      CustomTileWidget(text: translation.generic.logout, onPressed: () => viewModel.logout()),
                      SizedBox(height: Sizes.padding),
                    ],
                  ),
                  if (viewModel.showPageLoader) CustomCircularProgressIndicator()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
