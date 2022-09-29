import 'package:flutter/material.dart';

import 'signup_view_model_shared.dart';

class SignipViewModelMain extends ChangeNotifier
    with
        SignupViewModelShared,
        SignupViewModelNavigation,
        SignupViewModelSignupPage,
        SignupViewModelSecondPage {}
