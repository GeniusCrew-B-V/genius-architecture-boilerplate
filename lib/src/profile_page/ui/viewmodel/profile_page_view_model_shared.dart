import 'package:baseproject/src/profile_page/ui/model/profile_page_navigation_state_sub_page.dart';
import 'package:baseproject/src/start/ui/viewmodel/start_page_view_model_main.dart';
import 'package:flutter/material.dart';

import '../../../../i18n/translations.dart';
import '../../../base/base_navigation/domain/model/base_user_response_model.dart';
import '../../../base/base_navigation/ui/viewmodel/base_view_model_main.dart';
import '../../domain/model/profile_page_user_request_model.dart';
import '../../domain/profile_page_repository.dart';
import '../model/profile_page_navigation_state.dart';

part 'profile_page_model_navigation.dart';
part 'profile_page_view_model_main_page.dart';

mixin ProfilePageViewModelShared on ChangeNotifier {
  late ProfilePageRepository _repository;
  Function(String)? showSnackBar;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  late BaseViewModelMain baseViewModel;
  late StartPageViewModelMain startPageViewModel;

  GlobalKey<FormState> userFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> changePwdFormKey = GlobalKey<FormState>();

  void update(StartPageViewModelMain startPageViewModelMain, ProfilePageRepository repository, BaseViewModelMain baseViewModelMain) async {
    this.startPageViewModel = startPageViewModelMain;
    _repository = repository;
    baseViewModel = baseViewModelMain;
    initTextFormFieldController();
  }

  // ***************** Page Loader ************************
  // ******************************************************
  bool _showPageLoader = false;

  bool get showPageLoader => _showPageLoader;

  set showPageLoader(bool val) {
    _showPageLoader = val;
    notifyListeners();
  }

  // ******************************************************

  // ******************* User model ***********************
  // ******************************************************
  BaseUserResponseModel _profilePageUserResponseModel = BaseUserResponseModel(username: '', surname: '', name: '', email: '', phoneNumber: '', userId: 0, city: '');

  BaseUserResponseModel get userModel => _profilePageUserResponseModel;

  set userModel(BaseUserResponseModel newUser) {
    _profilePageUserResponseModel = newUser;
    notifyListeners();
  }

  // ******************************************************

  // ****************** Init methods **********************
  // ******************************************************

  initTextFormFieldController() async {
    userModel = baseViewModel.userModel!;
    email.text = userModel.email ?? '';
    username.text = userModel.username ?? '';
    name.text = userModel.name ?? '';
    surname.text = userModel.surname ?? '';
    city.text = userModel.city ?? '';
  }

  // ******************************************************

  // *************** FORMS Controller *********************
  // ******************************************************

  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController oldPwd = TextEditingController();
  TextEditingController newPwd = TextEditingController();
  TextEditingController confirmNewPwd = TextEditingController();

  // ******************************************************

  logout() {
    startPageViewModel.logOut();
  }
}
