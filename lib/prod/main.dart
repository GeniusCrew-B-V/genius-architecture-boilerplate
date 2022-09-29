import 'package:flutter/material.dart';

import '../src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  mainCommon(
    host: "https://31cae3b4-9771-4151-bdb2-41437d3b17ec.mock.pstmn.io",
    isProd: true,
  );
}
