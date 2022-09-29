import 'package:baseproject/src/base/widget/ui/app_bar_title.dart';
import 'package:baseproject/src/base/widget/ui/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../i18n/translations.dart';
import '../../../../resources/res.dart';
import '../../../base/widget/ui/text_form_fields/confirm_new_pwd_text_form_field.dart';
import '../../../base/widget/ui/text_form_fields/old_pwd_text_form_field.dart';
import '../../../base/widget/ui/text_form_fields/password_text_form_field.dart';
import '../viewmodel/profile_page_view_model_main.dart';

class ChangePwdPage extends StatelessWidget {
  final ProfilePageViewModelMain viewModel;
  final Function() onPop;

  const ChangePwdPage({required this.viewModel, required this.onPop});

  void _showSnackBar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      SnackBar snackBar = SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    viewModel.showSnackBar = (message) => _showSnackBar(context, message);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: AppBarTitle(title: translation.profilePage.editPassword),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: onPop,
          ),
        ),
        body: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.all(Sizes.padding),
                child: Form(
                  onChanged: () async {},
                  key: viewModel.changePwdFormKey,
                  child: ListView(
                    children: [
                      SizedBox(height: Sizes.padding),
                      OldPwdTextFormField(
                        viewModel.oldPwd,
                        obscureText: viewModel.showOldPassword,
                        suffixIcon: IconButton(icon: Icon(viewModel.showOldPassword ? Icons.visibility : Icons.visibility_off), onPressed: () => viewModel.onShowOldPasswordPressed()),
                      ),
                      SizedBox(height: Sizes.padding),
                      PasswordTextFormField(
                        viewModel.newPwd,
                        obscureText: viewModel.showNewPassword,
                        hintText: translation.textFormFieldHints.insertNewPassword,
                        suffixIcon: IconButton(icon: Icon(viewModel.showNewPassword ? Icons.visibility : Icons.visibility_off), onPressed: () => viewModel.onShowNewPasswordPressed()),
                      ),
                      SizedBox(height: Sizes.padding),
                      ConfirmNewPwdTextFormField(
                        viewModel.confirmNewPwd,
                        viewModel.newPwd,
                        obscureText: viewModel.showConfirmNewPassword,
                        suffixIcon: IconButton(icon: Icon(viewModel.showConfirmNewPassword ? Icons.visibility : Icons.visibility_off), onPressed: () => viewModel.onShowConfirmNewPasswordPressed()),
                      ),
                      SizedBox(height: Sizes.paddingM),
                      ElevatedButton(
                          onPressed: () async {
                            /* await viewModel.pwdReset(context); */
                          },
                          child: Text(translation.generic.save)),
                      SizedBox(height: Sizes.padding),
                    ],
                  ),
                )),
            if (viewModel.showPageLoader) CustomCircularProgressIndicator()
          ],
        ));
  }
}
