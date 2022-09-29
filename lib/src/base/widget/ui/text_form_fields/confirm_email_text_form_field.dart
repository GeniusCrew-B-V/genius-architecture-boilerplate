import 'package:flutter/material.dart';

import '../../../../../i18n/translations.dart';

class ConfirmEmailTextFormField extends StatefulWidget {
  final bool enabled;
  final TextEditingController? confirmEmailController;
  final TextEditingController? emailController;
  final Widget? suffixIcon;
  final bool? obscureText;

  ConfirmEmailTextFormField(this.confirmEmailController, this.emailController, {this.enabled = true, this.suffixIcon, this.obscureText});

  @override
  State<ConfirmEmailTextFormField> createState() => _ConfirmEmailTextFormFieldState();
}

class _ConfirmEmailTextFormFieldState extends State<ConfirmEmailTextFormField> {
  String? validateConfirmEmail() {
    if (widget.confirmEmailController!.text.isEmpty) {
      //emailFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.confirmEmailController!.text != widget.emailController!.text) {
      //emailFocus.requestFocus();
      return translation.textFieldValidations.emailsDontMatch;
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: widget.enabled,
        autofocus: false,
        controller: widget.confirmEmailController,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(hintText: translation.textFormFieldHints.email, suffixIcon: widget.suffixIcon),
        validator: (_) => validateConfirmEmail(),
        textCapitalization: TextCapitalization.sentences,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
