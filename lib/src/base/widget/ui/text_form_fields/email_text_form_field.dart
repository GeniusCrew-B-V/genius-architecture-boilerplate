import 'package:baseproject/resources/res.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../../../../../i18n/translations.dart';

class EmailTextFormField extends StatefulWidget {
  final bool enabled;
  final TextEditingController? emailController;
  final Function? onTap;
  final bool readOnly;
  final Widget? suffixIcon;

  EmailTextFormField(this.emailController, {this.enabled = true, this.onTap, this.readOnly = false, this.suffixIcon});

  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  FocusNode emailFocus = FocusNode();

  String? validateEmail() {
    if (widget.emailController!.text.isEmpty) {
      emailFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.emailController!.text.length > BaseProjectConst.EMAIL_TEXTFORMFIELD_MAX_LENGTH) {
      emailFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(BaseProjectConst.PLACEHOLDER), BaseProjectConst.EMAIL_TEXTFORMFIELD_MAX_LENGTH.toString());
    } else if (!isEmail(widget.emailController!.text) && widget.emailController!.text.isNotEmpty) {
      emailFocus.requestFocus();
      return translation.textFieldValidations.wrongCharacters;
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap == null ? null : () => widget.onTap!(),
      onEditingComplete: () {
        emailFocus.nextFocus();
      },
      onChanged: (text) {
        if (widget.emailController!.text.endsWith(' ')) {
          widget.emailController!.text = widget.emailController!.text.replaceAll(RegExp(r' '), '');
          widget.emailController!.selection = TextSelection.fromPosition(TextPosition(offset: widget.emailController!.text.length));
        }
      },
      readOnly: widget.readOnly,
      autofocus: false,
      controller: widget.emailController,
      validator: (_) => validateEmail(),
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      focusNode: emailFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(hintText: translation.textFormFieldHints.email, suffixIcon: widget.suffixIcon),
    );
  }
}
