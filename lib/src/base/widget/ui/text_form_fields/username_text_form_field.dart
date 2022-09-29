import 'package:flutter/material.dart';

import '../../../../../i18n/translations.dart';
import '../../../../../resources/res.dart';

class UsernameTextFormField extends StatefulWidget {
  final bool enabled;
  final TextEditingController? usernameController;

  UsernameTextFormField(this.usernameController, {this.enabled = true});

  @override
  State<UsernameTextFormField> createState() => _UsernameTextFormFieldState();
}

class _UsernameTextFormFieldState extends State<UsernameTextFormField> {
  FocusNode usernameFocus = FocusNode();

  String? validateUsername() {
    if (widget.usernameController!.text.isEmpty) {
      usernameFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.usernameController!.text.length > BaseProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      usernameFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(BaseProjectConst.PLACEHOLDER), BaseProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString());
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: widget.enabled,
        onEditingComplete: () {
          usernameFocus.unfocus();
        },
        autofocus: false,
        controller: widget.usernameController,
        validator: (_) => validateUsername(),
        textCapitalization: TextCapitalization.words,
        focusNode: usernameFocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(hintText: translation.generic.username),
      ),
    );
  }
}
