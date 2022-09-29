part of 'profile_page_view_model_shared.dart';

mixin ProfilePageViewModelNavigation on ProfilePageViewModelShared {
  ProfilePageNavigationState _profileNavigationState = ProfilePageNavigationState.profilePage;
  ProfilePageNavigationState get profileNavigationState => _profileNavigationState;

  set profileNavigationState(ProfilePageNavigationState newState) {
    _profileNavigationState = newState;
    baseViewModel.hideNavigationBar = _profileNavigationState != ProfilePageNavigationState.profilePage;
    notifyListeners();
  }

  ProfilePageNavigationStateSubPage _profileNavigationStateSubPage = ProfilePageNavigationStateSubPage.none;
  ProfilePageNavigationStateSubPage get profileNavigationStateSubPage => _profileNavigationStateSubPage;

  set profileNavigationStateSubPage(ProfilePageNavigationStateSubPage newState) {
    _profileNavigationStateSubPage = newState;
    notifyListeners();
  }
}
