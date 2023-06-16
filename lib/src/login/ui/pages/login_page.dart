import 'package:baseproject/i18n/translations.dart';
import 'package:baseproject/src/base/widget/ui/text_form_fields/email_text_form_field.dart';
import 'package:baseproject/src/base/widget/ui/text_form_fields/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../../resources/res.dart';
import '../../../base/widget/ui/custom_circular_progress_indicator.dart';
import '../viewmodel/login_view_model_main.dart';

class LoginPage extends StatefulWidget {
  final LoginViewModelMain viewModel;
  final Function onPop;

  const LoginPage({Key? key, required this.viewModel, required this.onPop}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _keyboardVisible = false;

  @protected
  void initState() {
    super.initState();
    KeyboardVisibilityController().onChange.listen((bool visible) {
      if (this.mounted) {
        setState(() {
          _keyboardVisible = visible;
        });
      }
    });
  }

  void _showSnackbar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      SnackBar snackBar = SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> _showForgotPasswordDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //backgroundColor: Colors.grey,
          title: Text(
            translation.loginPage.recoverPassword,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  translation.loginPage.insertEmailToRecoverPwd,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: Sizes.padding),
                Form(
                  key: widget.viewModel.forgotPwdFormKey,
                  child: EmailTextFormField(widget.viewModel.email),
                ),
                SizedBox(height: Sizes.paddingM),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await widget.viewModel.onForgotPwdUserClick();
                  },
                  child: Text(translation.loginPage.recover),
                ),
                SizedBox(height: Sizes.paddingS),
                TextButton(
                  child: Text(
                    translation.generic.cancel,
                    style: TextStyle(color: Colors.black, decoration: TextDecoration.none),
                  ),
                  onPressed: () {
                    //TODO IMPLEMENT
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.viewModel.showSnackBar = (message) => _showSnackbar(context, message);
    return WillPopScope(
      onWillPop: () => widget.onPop(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(translation.loginPage.title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => widget.onPop(),
          ),
        ),
        body: Builder(
          builder: (context) {
            widget.viewModel.showSnackBar = (message) => _showSnackbar(context, message);
            return Form(
              key: widget.viewModel.loginFormKey,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.padding),
                    child: ListView(
                      children: [
                        SizedBox(height: Sizes.paddingL),
                        Image.asset(ImageSrc.longLogo),
                        SizedBox(height: Sizes.paddingL),
                        Text(translation.loginPage.email, textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium),
                        SizedBox(height: Sizes.paddingS),
                        EmailTextFormField(widget.viewModel.email),
                        SizedBox(height: Sizes.paddingM),
                        Text(translation.loginPage.password, textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium),
                        SizedBox(height: Sizes.paddingS),
                        PasswordTextFormField(
                          widget.viewModel.password,
                          hintText: translation.textFormFieldHints.password,
                          obscureText: widget.viewModel.showPassword,
                          suffixIcon: IconButton(
                            icon: Icon(widget.viewModel.showPassword ? Icons.visibility : Icons.visibility_off),
                            onPressed: () => widget.viewModel.onShowPasswordPressed(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedCrossFade(
                      crossFadeState: _keyboardVisible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: Duration(milliseconds: Sizes.standardAnimationDuration),
                      secondChild: const SizedBox(
                        width: double.infinity,
                        height: 0,
                      ),
                      firstChild: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Sizes.padding),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () => _showForgotPasswordDialog(),
                              child: Text.rich(
                                TextSpan(children: <InlineSpan>[
                                  TextSpan(text: translation.loginPage.forgotPassword + " ", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: translation.loginPage.recoverPassword,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor))
                                ]),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: Sizes.padding,
                            ),
                            ElevatedButton(
                              onPressed: () => widget.viewModel.onLoginClick(),
                              child: Text(translation.generic.login),
                            ),
                            const SizedBox(
                              height: Sizes.padding,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: Sizes.paddingM,
                                ),
                                TextButton(
                                  onPressed: () => widget.viewModel.onNewUserClick(),
                                  child: Text.rich(
                                    TextSpan(children: <InlineSpan>[
                                      TextSpan(text: translation.loginPage.dontHaveAnAccount + " ", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: translation.loginPage.signupHere,
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context).primaryColor,
                                              ))
                                    ]),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: Sizes.padding,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (widget.viewModel.showPageLoader) CustomCircularProgressIndicator()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
