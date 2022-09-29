import 'package:flutter/material.dart';

import 'start_page_view_model_shared.dart';

class StartPageViewModelMain extends ChangeNotifier
    with
        StartPageViewModelShared,
        StartPageViewModelNavigation,
        StartPageViewModelFirstPage,
        StartPageViewModelSecondPage {}
