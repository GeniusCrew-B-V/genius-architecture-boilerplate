import 'package:baseproject/i18n/translations.dart';
import 'package:baseproject/src/base/widget/ui/text_form_fields/email_text_form_field.dart';
import 'package:baseproject/src/base/widget/ui/text_form_fields/name_text_form_field.dart';
import 'package:baseproject/src/base/widget/ui/text_form_fields/password_text_form_field.dart';
import 'package:baseproject/src/base/widget/ui/text_form_fields/surname_text_form_field.dart';
import 'package:baseproject/src/base/widget/ui/text_form_fields/username_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../resources/res.dart';
import '../../../base/widget/ui/custom_circular_progress_indicator.dart';
import '../../../base/widget/ui/text_form_fields/confirm_email_text_form_field.dart';
import '../../../base/widget/ui/text_form_fields/confirm_password_text_form_field.dart';
import '../viewmodel/signup_view_model_main.dart';

class SignupPage extends StatelessWidget {
  final SignupViewModelMain viewModel;
  final Function onPop;

  const SignupPage({Key? key, required this.viewModel, required this.onPop}) : super(key: key);

  void _showSnackbar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      SnackBar snackBar = SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    viewModel.showSnackBar = (message) => _showSnackbar(context, message);

    return WillPopScope(
      onWillPop: () => onPop(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          actions: [
            Center(
              child: Padding(padding: EdgeInsets.only(right: Sizes.padding), child: Image.asset(ImageSrc.logo, height: 35)),
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => onPop(),
          ),
        ),
        body: Builder(
          builder: (context) {
            viewModel.showSnackBar = (message) => _showSnackbar(context, message);
            return Form(
              key: viewModel.signupFormKey,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Sizes.padding),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: Sizes.padding,
                              ),
                              Image.asset(ImageSrc.longLogo),
                              const SizedBox(
                                height: Sizes.paddingM,
                              ),
                              Text(translation.generic.username, textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium),
                              SizedBox(height: Sizes.paddingS),
                              UsernameTextFormField(viewModel.username),
                              SizedBox(height: Sizes.padding),
                              Text(translation.generic.name, textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium),
                              SizedBox(height: Sizes.paddingS),
                              NameTextFormField(viewModel.name),
                              SizedBox(height: Sizes.padding),
                              SizedBox(height: Sizes.paddingS),
                              Text(translation.generic.surname, textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium),
                              SizedBox(height: Sizes.paddingS),
                              SurnameTextFormField(viewModel.surname),
                              SizedBox(height: Sizes.padding),
                              const Divider(
                                thickness: 2,
                                color: AppColors.navigationBarColor,
                              ),
                              SizedBox(height: Sizes.padding),
                              Text(translation.generic.email, textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium),
                              SizedBox(height: Sizes.paddingS),
                              EmailTextFormField(viewModel.email),
                              SizedBox(height: Sizes.padding),
                              Text(translation.generic.confirmEmail, textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium),
                              SizedBox(height: Sizes.paddingS),
                              ConfirmEmailTextFormField(viewModel.confirmEmail, viewModel.email),
                              SizedBox(height: Sizes.padding),
                              const Divider(
                                thickness: 2,
                                color: AppColors.navigationBarColor,
                              ),
                              SizedBox(height: Sizes.padding),
                              Text(translation.generic.password, textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium),
                              SizedBox(height: Sizes.paddingS),
                              PasswordTextFormField(
                                viewModel.password,
                                hintText: translation.textFormFieldHints.password,
                                obscureText: viewModel.showPassword,
                                suffixIcon: IconButton(
                                  icon: Icon(viewModel.showPassword ? Icons.visibility : Icons.visibility_off),
                                  onPressed: () => viewModel.onShowPasswordPressed(),
                                ),
                              ),
                              SizedBox(height: Sizes.padding),
                              Text(translation.generic.confirmPassword, textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium),
                              SizedBox(height: Sizes.paddingS),
                              ConfirmPwdTextFormField(
                                viewModel.confirmPassword,
                                viewModel.password,
                                obscureText: viewModel.showConfirmPassword,
                                suffixIcon: IconButton(
                                  icon: Icon(viewModel.showConfirmPassword ? Icons.visibility : Icons.visibility_off),
                                  onPressed: () => viewModel.onShowConfirmPasswordPressed(),
                                ),
                              ),
                              SizedBox(height: Sizes.paddingL),
                              Padding(
                                padding: EdgeInsets.only(bottom: Sizes.paddingL),
                                child: Align(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () => viewModel.onContinueClick(),
                                        child: Text(translation.generic.continueTxt),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (viewModel.showPageLoader) CustomCircularProgressIndicator()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
