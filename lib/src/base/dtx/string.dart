extension StringExt on String? {
  bool get isValid => this != null && (this?.isNotEmpty ?? false);
}
