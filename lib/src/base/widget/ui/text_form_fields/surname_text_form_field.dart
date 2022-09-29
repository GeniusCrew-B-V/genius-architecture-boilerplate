import 'package:flutter/material.dart';

import '../../../../../i18n/translations.dart';
import '../../../../../resources/res.dart';

class SurnameTextFormField extends StatefulWidget {
  final bool enabled;
  final TextEditingController? surnameController;

  SurnameTextFormField(this.surnameController, {this.enabled = true});

  @override
  State<SurnameTextFormField> createState() => _SurnameTextFormFieldState();
}

class _SurnameTextFormFieldState extends State<SurnameTextFormField> {
  FocusNode surnameFocus = FocusNode();

  String? validateSurname() {
    if (widget.surnameController!.text.isEmpty) {
      surnameFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.surnameController!.text.length > BaseProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      surnameFocus.requestFocus();
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
          surnameFocus.unfocus();
        },
        autofocus: false,
        controller: widget.surnameController,
        validator: (_) => validateSurname(),
        textCapitalization: TextCapitalization.words,
        focusNode: surnameFocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(hintText: translation.textFormFieldHints.surname),
      ),
    );
  }
}
