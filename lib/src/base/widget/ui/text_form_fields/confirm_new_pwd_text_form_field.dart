import 'package:flutter/material.dart';

import '../../../../../i18n/translations.dart';

class ConfirmNewPwdTextFormField extends StatefulWidget {
  final bool enabled;
  final TextEditingController? confirmNewPasswordController;
  final TextEditingController? passwordController;
  final Widget? suffixIcon;
  final bool? obscureText;

  ConfirmNewPwdTextFormField(this.confirmNewPasswordController, this.passwordController, {this.enabled = true, this.suffixIcon, this.obscureText});

  @override
  State<ConfirmNewPwdTextFormField> createState() => _ConfirmNewPwdTextFormFieldState();
}

class _ConfirmNewPwdTextFormFieldState extends State<ConfirmNewPwdTextFormField> {
  String? validateConfirmNewPwd() {
    if (widget.confirmNewPasswordController!.text.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.confirmNewPasswordController!.text != widget.passwordController!.text) {
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
        controller: widget.confirmNewPasswordController,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(hintText: translation.textFormFieldHints.confirmNewPassword, suffixIcon: widget.suffixIcon),
        validator: (_) => validateConfirmNewPwd(),
        textCapitalization: TextCapitalization.sentences,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
