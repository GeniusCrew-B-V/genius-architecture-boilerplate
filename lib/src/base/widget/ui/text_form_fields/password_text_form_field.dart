import 'package:flutter/material.dart';

import '../../../../../i18n/translations.dart';
import '../../../../../resources/res.dart';

class PasswordTextFormField extends StatefulWidget {
  final bool enabled;
  final TextEditingController? passwordController;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool isAutoFocusEnabled;
  final String? hintText;

  PasswordTextFormField(this.passwordController, {this.enabled = true, this.suffixIcon, this.obscureText, this.isAutoFocusEnabled = true, this.hintText});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  FocusNode newPasswordFocus = FocusNode();

  String? validatePwd() {
    if (widget.passwordController!.text.isEmpty) {
      if (widget.isAutoFocusEnabled) newPasswordFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.passwordController!.text.length > BaseProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      if (widget.isAutoFocusEnabled) newPasswordFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(BaseProjectConst.PLACEHOLDER), BaseProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString());
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: widget.enabled,
        autofocus: false,
        controller: widget.passwordController!,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(hintText: widget.hintText, suffixIcon: widget.suffixIcon),
        validator: (_) => validatePwd(),
        textCapitalization: TextCapitalization.sentences,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
