import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final backgroundColor;
  final color;

  CustomCircularProgressIndicator({this.backgroundColor, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor.withAlpha(128),
      child: Center(child: CircularProgressIndicator(color: color ?? Theme.of(context).primaryColor)),
    );
  }
}
