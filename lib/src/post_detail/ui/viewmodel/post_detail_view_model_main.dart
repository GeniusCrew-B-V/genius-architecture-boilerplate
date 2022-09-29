import 'package:flutter/material.dart';

import 'post_detail_view_model_shared.dart';

class PostDetailViewModelMain extends ChangeNotifier
    with
        PostDetailViewModelShared,
        PostDetailViewModelNavigation,
        PostDetailViewModel {}
