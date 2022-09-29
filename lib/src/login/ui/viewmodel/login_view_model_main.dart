import 'package:flutter/material.dart';

import 'login_view_model_shared.dart';

class LoginViewModelMain extends ChangeNotifier
    with
        LoginViewModelShared,
        LoginViewModelNavigation,
        LoginViewModelLoginPage {}
