import 'package:baseproject/src/base/base_navigation/ui/viewmodel/base_view_model_main.dart';
import 'package:baseproject/src/base/models/posts/post_model_response.dart';
import 'package:baseproject/src/post_detail/domain/post_detail_repository.dart';
import 'package:baseproject/src/post_detail/ui/model/post_detail_navigation_state.dart';
import 'package:flutter/material.dart';

part 'post_detail_view_model.dart';
part 'post_detail_view_model_navigation.dart';

mixin PostDetailViewModelShared on ChangeNotifier {
  late PostDetailRepository postDetailRepository;
  late BaseViewModelMain baseViewModel;
  Function(String)? showSnackBar;
  bool _showPageLoader = true;
  String postNavigationNavigationId = '';

  PostDetailNavigationState _postDetailNavigationState =
      PostDetailNavigationState.postDetailPage;
  PostDetailNavigationState get postDetailNavigationState =>
      _postDetailNavigationState;

  late Future<List<PostModelResponse>> postList;

  set postDetailNavigationState(PostDetailNavigationState newState) {
    _postDetailNavigationState = newState;
    notifyListeners();
  }

  bool get showPageLoader => _showPageLoader;
  set showPageLoader(bool value) {
    _showPageLoader = value;
    notifyListeners();
  }

  void update(
    PostDetailRepository repository,
    BaseViewModelMain newBaseViewModelMain,
  ) {
    postDetailRepository = repository;
    baseViewModel = newBaseViewModelMain;
  }
}
