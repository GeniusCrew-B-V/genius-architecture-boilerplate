import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base/base_navigation/ui/pages/settings_page.dart';
import '../../../base/widget/ui/custom_navigator_pop_scope.dart';
import '../../di/profile_page_providers.dart';
import '../model/profile_page_navigation_state.dart';
import '../pages/change_pwd_dialog.dart';
import '../pages/personal_data_page.dart';
import '../pages/profile_page.dart';
import '../viewmodel/profile_page_view_model_main.dart';

final _profilePageNavigationKey = GlobalKey<NavigatorState>();

class ProfilePageNavigator extends StatelessWidget {
  final Function()? onMainPop;

  const ProfilePageNavigator({
    this.onMainPop,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...profilePageProviders,
      ],
      child: Consumer<ProfilePageViewModelMain>(
        builder: (_, profileViewModel, __) {
          return CustomNavigatorPopScope(
            navigatorStateKey: _profilePageNavigationKey,
            pages: [
              MaterialPage(
                child: ProfilePage(
                  viewModel: profileViewModel,
                  onPop: onMainPop,
                ),
              ),
              if (profileViewModel.profileNavigationState == ProfilePageNavigationState.personalDataPage)
                MaterialPage(
                  child: PersonalDataPage(
                    viewModel: profileViewModel,
                    onPop: () => profileViewModel.profileNavigationState = ProfilePageNavigationState.profilePage,
                  ),
                ),
              if (profileViewModel.profileNavigationState == ProfilePageNavigationState.changePwdPage)
                MaterialPage(
                  child: ChangePwdPage(
                    viewModel: profileViewModel,
                    onPop: () {
                      profileViewModel.profileNavigationState = ProfilePageNavigationState.profilePage;
                      profileViewModel.oldPwd = TextEditingController();
                      profileViewModel.newPwd = TextEditingController();
                      profileViewModel.confirmNewPwd = TextEditingController();
                    },
                  ),
                ),
              if (profileViewModel.profileNavigationState == ProfilePageNavigationState.settingsPage)
                MaterialPage(
                  child: SettingsPage(
                    onPop: () => profileViewModel.profileNavigationState = ProfilePageNavigationState.profilePage,
                    viewModel: profileViewModel.baseViewModel,
                  ),
                ),
            ],
            onPopPage: (route, result) {
              profileViewModel.profileNavigationState = ProfilePageNavigationState.profilePage;
              return true;
            },
          );
        },
      ),
    );
  }
}
