import 'package:baseproject/resources/res.dart';
import 'package:flutter/material.dart';

import '../../../../../i18n/translations.dart';

class OldPwdTextFormField extends StatefulWidget {
  final bool enabled;
  final TextEditingController? oldPasswordController;
  final Widget? suffixIcon;
  final bool? obscureText;

  OldPwdTextFormField(this.oldPasswordController, {this.enabled = true, this.suffixIcon, this.obscureText});

  @override
  State<OldPwdTextFormField> createState() => _OldPwdTextFormFieldState();
}

class _OldPwdTextFormFieldState extends State<OldPwdTextFormField> {
  FocusNode oldPasswordFocus = FocusNode();

  String? validateOldPwd() {
    if (widget.oldPasswordController!.text.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.oldPasswordController!.text.length > BaseProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
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
        controller: widget.oldPasswordController,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(hintText: translation.textFormFieldHints.insertOldPassword, suffixIcon: widget.suffixIcon),
        validator: (_) => validateOldPwd(),
        textCapitalization: TextCapitalization.sentences,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
