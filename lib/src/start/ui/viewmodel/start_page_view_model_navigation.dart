part of 'start_page_view_model_shared.dart';

mixin StartPageViewModelNavigation on StartPageViewModelShared {
  int _currentPlaceholderForTutorial = 0;

  int get currentPlaceholderForTutorial => _currentPlaceholderForTutorial;

  set currentPlaceholderForTutorial(int newCurrentPlaceholderForTutorial) {
    _currentPlaceholderForTutorial = newCurrentPlaceholderForTutorial;
    notifyListeners();
  }

  static const int MAX_PLACEHOLDERS_FOR_TUTORIAL = 2;

  get maxPlaceholdersForTutorial => MAX_PLACEHOLDERS_FOR_TUTORIAL;

  onPlaceholderClick(int val) => currentPlaceholderForTutorial = val;

  goBackTutorialState() {
    if (currentPlaceholderForTutorial > 0) {
      currentPlaceholderForTutorial -= 1;
      notifyListeners();
    }
  }

  nextTutorialState() {
    if (currentPlaceholderForTutorial < MAX_PLACEHOLDERS_FOR_TUTORIAL) {
      currentPlaceholderForTutorial += 1;
      notifyListeners();
    } else {
      print('Open access page');
      navigationState = StartPageNavigationState.accessPage;
    }
  }

  onSignupClick() {
    navigationState = StartPageNavigationState.signUpPage;
  }

  onDoYouAlreadyHaveAnAccountClick() {
    navigationState = StartPageNavigationState.loginPage;
  }
}
