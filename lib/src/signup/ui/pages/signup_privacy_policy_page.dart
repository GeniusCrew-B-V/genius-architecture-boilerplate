import 'package:baseproject/i18n/translations.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../resources/res.dart';
import '../../../base/widget/ui/custom_circular_progress_indicator.dart';
import '../viewmodel/signup_view_model_main.dart';

class SignupPrivacyPolicyPage extends StatelessWidget {
  final SignipViewModelMain viewModel;
  final Function onPop;

  const SignupPrivacyPolicyPage({Key? key, required this.viewModel, required this.onPop}) : super(key: key);

  _termsAndConditions(BuildContext context) {
    return SwitchListTile(
      inactiveThumbColor: viewModel.termsAndConditionsColor,
      activeColor: Theme.of(context).primaryColor,
      contentPadding: EdgeInsets.all(0),
      title: GestureDetector(
        onTap: () => launchUrl("https://baseproject.com/terms-and-conditions/"),
        child: Text(translation.signupPage.acceptTermsAndConditions, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
      ),
      value: viewModel.isTermsAndConditionsAccepted,
      onChanged: (newVal) async {
        viewModel.onTermsAndConditionsPressed(context, newVal);
      },
    );
  }

  _privacyPolicyPoint2A(BuildContext context) {
    return SwitchListTile(
      inactiveThumbColor: viewModel.privacyPolicyPoint2AColor,
      activeColor: Theme.of(context).primaryColor,
      contentPadding: EdgeInsets.all(0),
      title: Text(
        translation.signupPage.privacyPolicy1,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.normal),
      ),
      value: viewModel.isPrivacyPolicyPoint2AAccepted,
      onChanged: (newVal) async {
        viewModel.onPrivacyPolicyPoint2APressed(context, newVal);
      },
    );
  }

  _privacyPolicyPoint2B0(BuildContext context) {
    return SwitchListTile(
      inactiveThumbColor: viewModel.privacyPolicyPoint2B0Color,
      activeColor: Theme.of(context).primaryColor,
      contentPadding: EdgeInsets.all(0),
      title: Text(
        translation.signupPage.privacyPolicy2B0,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.normal),
      ),
      value: viewModel.isPrivacyPolicyPoint2B0Accepted,
      onChanged: (newVal) async {
        viewModel.onPrivacyPolicyPoint2B0Pressed(context, newVal);
      },
    );
  }

  _privacyPolicyPoint2B1(BuildContext context) {
    return SwitchListTile(
      inactiveThumbColor: viewModel.privacyPolicyPoint2B1Color,
      activeColor: Theme.of(context).primaryColor,
      contentPadding: EdgeInsets.all(0),
      title: Text(
        translation.signupPage.privacyPolicy2B1,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.normal),
      ),
      value: viewModel.isPrivacyPolicyPoint2B1Accepted,
      onChanged: (newVal) async {
        viewModel.onPrivacyPolicyPoint2B1Pressed(context, newVal);
      },
    );
  }

  _privacyPolicyPoint2B2(BuildContext context) {
    return SwitchListTile(
      inactiveThumbColor: viewModel.privacyPolicyPoint2B2Color,
      activeColor: Theme.of(context).primaryColor,
      contentPadding: EdgeInsets.all(0),
      title: Text(
        translation.signupPage.privacyPolicy2B2,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.normal),
      ),
      value: viewModel.isPrivacyPolicyPoint2B2Accepted,
      onChanged: (newVal) async {
        viewModel.onPrivacyPolicyPoint2B2Pressed(context, newVal);
      },
    );
  }

  _privacyPolicyPoint2B3(BuildContext context) {
    return SwitchListTile(
      inactiveThumbColor: viewModel.privacyPolicyPoint2B3Color,
      activeColor: Theme.of(context).primaryColor,
      contentPadding: EdgeInsets.all(0),
      title: Text(
        translation.signupPage.privacyPolicy2B3,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.normal),
      ),
      value: viewModel.isPrivacyPolicyPoint2B3Accepted,
      onChanged: (newVal) async {
        viewModel.onPrivacyPolicyPoint2B3Pressed(context, newVal);
      },
    );
  }

  launchUrl(String url) async => await canLaunchUrlString(url) ? await launchUrlString(url) : throw 'Could not launch url';

  @override
  Widget build(BuildContext context) {
    viewModel.showSnackBar = (message) => showSnackbar(context, message);
    return WillPopScope(
      onWillPop: () => onPop(),
      child: Scaffold(
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
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(Sizes.padding),
                child: Column(children: [
                  Expanded(
                      child: ListView(
                    children: [
                      Text(
                        translation.signupPage.privacyTitle,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      Divider(color: Colors.transparent, height: Sizes.padding),
                      Text(
                        translation.signupPage.acceptPrivacy,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(color: AppColors.gray),
                      ),
                      Divider(color: Colors.transparent, height: Sizes.paddingM),
                      _termsAndConditions(context),
                      Divider(height: Sizes.paddingM),
                      Divider(color: Colors.transparent, height: Sizes.padding),
                      InkWell(
                        onTap: () => launchUrl("https://app.baseproject.com/privacy-policy/"),
                        child: Text(
                          translation.signupPage.gdpr,
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(color: Colors.transparent, height: Sizes.padding),
                      _privacyPolicyPoint2A(context),
                      Divider(color: Colors.transparent, height: Sizes.paddingS),
                      _privacyPolicyPoint2B0(context),
                      Divider(color: Colors.transparent, height: Sizes.paddingS),
                      _privacyPolicyPoint2B1(context),
                      Divider(color: Colors.transparent, height: Sizes.paddingS),
                      _privacyPolicyPoint2B2(context),
                      Divider(color: Colors.transparent, height: Sizes.paddingS),
                      _privacyPolicyPoint2B3(context),
                      Padding(
                        padding: EdgeInsets.only(top: Sizes.paddingM),
                        child: Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () => viewModel.onSignupClick(),
                                child: Text(translation.signupPage.signup),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(color: Colors.transparent, height: Sizes.paddingXXL),
                    ],
                  )),
                ]),
              ),
              if (viewModel.showPageLoader) CustomCircularProgressIndicator()
            ],
          ),
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
