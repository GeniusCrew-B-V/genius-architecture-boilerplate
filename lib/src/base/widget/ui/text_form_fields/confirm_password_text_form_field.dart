import 'package:flutter/material.dart';

import '../../../../../i18n/translations.dart';

class ConfirmPwdTextFormField extends StatefulWidget {
  final bool enabled;
  final TextEditingController? confirmPasswordController;
  final TextEditingController? passwordController;
  final Widget? suffixIcon;
  final bool? obscureText;

  ConfirmPwdTextFormField(this.confirmPasswordController, this.passwordController, {this.enabled = true, this.suffixIcon, this.obscureText});

  @override
  State<ConfirmPwdTextFormField> createState() => _ConfirmPwdTextFormFieldState();
}

class _ConfirmPwdTextFormFieldState extends State<ConfirmPwdTextFormField> {
  String? validateConfirmPwd() {
    if (widget.confirmPasswordController!.text.isEmpty) {
      //passwordFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.confirmPasswordController!.text != widget.passwordController!.text) {
      //passwordFocus.requestFocus();
      return translation.textFieldValidations.passwordsDontMatch;
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: widget.enabled,
        autofocus: false,
        controller: widget.confirmPasswordController,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(hintText: translation.textFormFieldHints.password, suffixIcon: widget.suffixIcon),
        validator: (_) => validateConfirmPwd(),
        textCapitalization: TextCapitalization.sentences,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
