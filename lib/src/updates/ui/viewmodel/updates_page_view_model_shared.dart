import 'package:baseproject/i18n/translations.dart';
import 'package:baseproject/src/base/models/posts/post_model_response.dart';
import 'package:baseproject/src/base/models/posts/posts_filter_model.dart';
import 'package:flutter/material.dart';

import '../../../base/base_navigation/ui/viewmodel/base_view_model_main.dart';
import '../../domain/updates_page_repository.dart';
import '../model/updates_page_navigation_state.dart';

part 'updates_page_view_model.dart';

mixin UpdatesPageViewModelShared on ChangeNotifier {
  update(UpdatesPageRepository updatesPageRepository, BaseViewModelMain baseViewModel){
    this.updatesPageRepository = updatesPageRepository;
    this.baseViewModel = baseViewModel;
  }

  late UpdatesPageRepository updatesPageRepository;
  late BaseViewModelMain baseViewModel;

  Function(String)? showSnackBar;
  bool _showPageLoader = true;

  UpdatesPageNavigationState _updatesNavigationState = UpdatesPageNavigationState.baseUpdatesPage;

  UpdatesPageNavigationState get updatesNavigationState => _updatesNavigationState;

  set updatesNavigationState(UpdatesPageNavigationState newState) {
    _updatesNavigationState = newState;
    baseViewModel.hideNavigationBar = _updatesNavigationState != UpdatesPageNavigationState.baseUpdatesPage;
    notifyListeners();
  }

  bool get showPageLoader => _showPageLoader;

  set showPageLoader(bool value) {
    _showPageLoader = value;
    //notifyListeners();
  }
}
