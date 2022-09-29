import 'package:baseproject/resources/res.dart';
import 'package:flutter/material.dart';

class StartAppBar extends StatefulWidget {
  const StartAppBar({Key? key}) : super(key: key);

  @override
  _StartAppBarState createState() => _StartAppBarState();
}

class _StartAppBarState extends State<StartAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageSrc.logo,
          height: 60,
          width: 60,
        )
      ],
    );
  }
}
