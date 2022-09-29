import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../../../../../i18n/translations.dart';
import '../../../../../resources/res.dart';

class CityTextFormField extends StatefulWidget {
  final bool enabled;
  final TextEditingController? cityController;

  CityTextFormField(this.cityController, {this.enabled = true});

  @override
  State<CityTextFormField> createState() => _CityTextFormFieldState();
}

class _CityTextFormFieldState extends State<CityTextFormField> {
  FocusNode cityFocus = FocusNode();

  String? validateCity() {
    if (widget.cityController!.text.isEmpty) {
      cityFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.cityController!.text.length > BaseProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      cityFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(BaseProjectConst.PLACEHOLDER), BaseProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString());
    } else if (!isAlphanumeric(widget.cityController!.text.replaceAll(r' ', '')) && widget.cityController!.text.isNotEmpty) {
      cityFocus.requestFocus();
      return translation.textFieldValidations.wrongCharacters;
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: widget.enabled,
        onEditingComplete: () {
          cityFocus.unfocus();
        },
        autofocus: false,
        controller: widget.cityController,
        validator: (_) => validateCity(),
        textCapitalization: TextCapitalization.words,
        focusNode: cityFocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
