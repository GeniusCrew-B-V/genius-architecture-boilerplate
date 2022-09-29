import 'package:baseproject/src/start/ui/viewmodel/start_page_view_model_main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../resources/res.dart';
import '../../../settings/ui/viewmodel/theme_viewmodel.dart';
import '../../domain/base_repository.dart';
import '../../domain/model/base_user_response_model.dart';
import '../model/base_navigation_state.dart';

mixin BaseViewModelShared on ChangeNotifier {
  late BaseRepository baseRepository;
  late StartPageViewModelMain startPageViewModel;
  Function(String)? showSnackBar;
  bool _showPageLoader = false;

  bool hasLoadedUser = false;

  bool get showPageLoader => _showPageLoader;

  bool isLogoFromNetwork = false;
  late String _appLogo = ImageSrc.logo;

  String get appLogo => _appLogo;

  set appLogo(String? value) {
    _appLogo = value ?? ImageSrc.logo;
    isLogoFromNetwork = value != null;
    notifyListeners();
  }

  set showPageLoader(bool val) {
    _showPageLoader = val;
    notifyListeners();
  }

  SharedPreferences? prefs;

  late ThemeViewModel _themeViewModel;

  ThemeViewModel get themeViewModel => _themeViewModel;

  bool? _darkTheme;
  bool? _accessibility;

  bool? get darkTheme => _darkTheme;

  set darkTheme(bool? value) {
    _darkTheme = value;
    notifyListeners();
  }

  set themeViewModel(ThemeViewModel newVal) {
    _themeViewModel = newVal;
    notifyListeners();
  }

  void update(BaseRepository repository, StartPageViewModelMain newStartPageViewModelMain, ThemeViewModel newThemeViewModel) async {
    baseRepository = repository;
    themeViewModel = newThemeViewModel;
    startPageViewModel = newStartPageViewModelMain;
    if (darkTheme == null) {
      darkTheme = !themeViewModel.isLightMode;
    }
    initUserDatas();
  }

  onThemeDarkSwitch(bool value) {
    darkTheme = value;
    if (darkTheme!) {
      _themeViewModel.setDarkTheme();
    } else {
      _themeViewModel.setLightTheme();
    }
    print(_themeViewModel.getIfDarkMode());
  }

  // ******************* Base user ************************
  // ******************************************************

  BaseUserResponseModel? _user;

  BaseUserResponseModel? get userModel => _user;

  set userModel(BaseUserResponseModel? newUser) {
    _user = newUser;
    if (hasLoadedUser) {
      hasLoadedUser = true;
    }
    notifyListeners();
  }

  // ******************************************************
  // ******************************************************

  int _bottomMenuIndex = 0;

  int get bottomMenuIndex => _bottomMenuIndex;

  set bottomMenuIndex(int newIndex) {
    _bottomMenuIndex = newIndex;
    notifyListeners();
  }

  final GlobalKey<ScaffoldState> basePageScaffoldKey = new GlobalKey<ScaffoldState>();

  BaseNavigationSubPagesState _baseNavigationSubPagesState = BaseNavigationSubPagesState.none;

  BaseNavigationSubPagesState get baseNavigationSubPagesState => _baseNavigationSubPagesState;

  set baseNavigationSubPagesState(BaseNavigationSubPagesState newSubPage) {
    _baseNavigationSubPagesState = newSubPage;
    _hideNavigationBar = _baseNavigationSubPagesState != BaseNavigationSubPagesState.none;
    notifyListeners();
  }

  // ****************** Init methods **********************
  // ******************************************************

  initUserDatas() async {
    userModel = await baseRepository.initUserDatas().catchError((e) {
      print(e);
    });
  }

  void logOut() async {
    startPageViewModel.logOut();
    //baseRepository.logOut()
  }

  bool _hideNavigationBar = false;

  bool get hideNavigationBar => _hideNavigationBar;

  set hideNavigationBar(bool hideNavigationBar) {
    _hideNavigationBar = hideNavigationBar;
    notifyListeners();
  }
}
