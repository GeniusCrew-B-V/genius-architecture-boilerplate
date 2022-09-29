import 'package:flutter/material.dart';

import '../../../base/base_navigation/ui/viewmodel/base_view_model_main.dart';
import '../../domain/home_card_model.dart';
import '../../domain/home_page_repository.dart';
import '../model/home_page_navigation_state.dart';

part 'home_page_view_model.dart';
part 'home_page_view_model_navigation.dart';

mixin HomePageViewModelShared on ChangeNotifier {
  late HomePageRepository homePageRepository;
  late BaseViewModelMain baseViewModel;
  Function(String)? showSnackBar;

  bool _showPageLoader = true;

  bool get showPageLoader => _showPageLoader;

  set showPageLoader(bool value) {
    _showPageLoader = value;
  }

  void update(
    HomePageRepository repository,
    BaseViewModelMain newBaseViewModelMain,
  ) {
    homePageRepository = repository;
    baseViewModel = newBaseViewModelMain;
  }

// *************************************+
// ************ Navigation *************+
// *************************************+

  HomePageNavigationState _homeNavigationState = HomePageNavigationState.baseHomePage;

  HomePageNavigationState get homeNavigationState => _homeNavigationState;

  set homeNavigationState(HomePageNavigationState newState) {
    _homeNavigationState = newState;
    baseViewModel.hideNavigationBar = _homeNavigationState != HomePageNavigationState.baseHomePage;
    notifyListeners();
  }

// *************************************+
// *************************************+
// *************************************+

  final List<HomeCardModel> fakeModels = [
    HomeCardModel(title: "Titolo", description: "Descrizione", userInitials: "FL"),
    HomeCardModel(
        title: "Titolo",
        description:
            "L'inerbimento naturale dei nostri frutteti  biologici . Le erbe spontanee attraverso il loro apparato radicale permettono alla Terra di respirare e attraverso i loro fiori attraggono gli impollinatori. Non le chiamiamo erbacce!",
        userInitials: "ET"),
    HomeCardModel(title: "Titolo", description: "A me piacciono i treni", userInitials: "FL"),
    HomeCardModel(title: "Titolo", description: "Descrizione", userInitials: "ET"),
  ];
}
