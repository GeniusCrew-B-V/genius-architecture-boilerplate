import 'package:baseproject/i18n/translations.dart';
import 'package:baseproject/src/signup/ui/model/signup_navigation_state.dart';
import 'package:flutter/material.dart';

import '../../../../resources/res.dart';
import '../viewmodel/signup_view_model_main.dart';

class SignupConfirmPage extends StatelessWidget {
  final SignipViewModelMain viewModel;
  final Function onPop;

  const SignupConfirmPage({Key? key, required this.viewModel, required this.onPop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onPop(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            viewModel.showSnackBar = (message) => showSnackbar(context, message);
            return Padding(
              padding: const EdgeInsets.all(Sizes.padding),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Column(
                    children: [
                      Image.asset(ImageSrc.longLogo),
                      SizedBox(height: Sizes.paddingL),
                      Image.asset(ImageSrc.registrationSuccessImage),
                      SizedBox(height: Sizes.padding),
                      Text(translation.signupPage.checkEmail, style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(height: Sizes.padding),
                      Text.rich(
                        TextSpan(children: <InlineSpan>[
                          TextSpan(text: '${translation.signupPage.sentToEmail}\n', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(text: viewModel.email.text, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                        ]),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: Sizes.padding),
                      Text(translation.signupPage.checkSpam, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w500, color: AppColors.gray)),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: Sizes.padding),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () => viewModel.signupNavigationState = SignupNavigationState.loginPage,
                        child: Text(translation.generic.backToLogin),
                      ),
                    ),
                  ),
                  TextButton(
                    //TODO implement API call to get new password
                    onPressed: () => {},
                    child: Text.rich(
                      TextSpan(children: <InlineSpan>[
                        TextSpan(text: "${translation.signupPage.notReceived} ", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold)),
                        TextSpan(text: translation.signupPage.sendAgain, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor))
                      ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      SnackBar snackBar = SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
