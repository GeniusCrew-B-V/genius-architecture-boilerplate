import 'package:flutter/material.dart';

class TutorialWidgetModel {
  final String? imagePath;
  final String title;
  final String description;
  final Widget? customWidget;

  TutorialWidgetModel({
    this.imagePath,
    required this.title,
    required this.description,
    this.customWidget,
  });
}
