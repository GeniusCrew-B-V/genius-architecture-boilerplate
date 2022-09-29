import 'package:baseproject/resources/res.dart';
import 'package:flutter/material.dart';

import '../../../../../i18n/translations.dart';

class NameTextFormField extends StatefulWidget {
  final bool enabled;
  final TextEditingController? nameController;

  NameTextFormField(this.nameController, {this.enabled = true});

  @override
  State<NameTextFormField> createState() => _NameTextFormFieldState();
}

class _NameTextFormFieldState extends State<NameTextFormField> {
  FocusNode nameFocus = FocusNode();

  String? validateName() {
    if (widget.nameController!.text.isEmpty) {
      nameFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.nameController!.text.length > BaseProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      nameFocus.requestFocus();
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
          nameFocus.unfocus();
        },
        autofocus: false,
        controller: widget.nameController,
        validator: (_) => validateName(),
        textCapitalization: TextCapitalization.words,
        focusNode: nameFocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(hintText: translation.textFormFieldHints.name),
      ),
    );
  }
}
