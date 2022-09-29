import 'package:baseproject/src/base/widget/ui/app_bar_title.dart';
import 'package:flutter/material.dart';

import '../../../../i18n/translations.dart';
import '../../../../resources/res.dart';
import '../../../base/widget/ui/custom_circular_progress_indicator.dart';
import '../../../base/widget/ui/text_form_fields/city_text_form_field.dart';
import '../../../base/widget/ui/text_form_fields/email_text_form_field.dart';
import '../../../base/widget/ui/text_form_fields/name_text_form_field.dart';
import '../../../base/widget/ui/text_form_fields/surname_text_form_field.dart';
import '../../../base/widget/ui/text_form_fields/username_text_form_field.dart';
import '../viewmodel/profile_page_view_model_main.dart';

class PersonalDataPage extends StatelessWidget {
  final ProfilePageViewModelMain viewModel;
  final Function()? onPop;

  const PersonalDataPage({
    required this.viewModel,
    this.onPop,
  });

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
        title: AppBarTitle(title: translation.profilePage.changePersonalInfos),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: onPop,
        ),
      ),
      body: Builder(
        builder: (context) {
          viewModel.showSnackBar = (message) => _showSnackBar(context, message);
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(Sizes.padding),
                child: Column(
                  children: [
                    Expanded(
                      child: Form(
                        key: viewModel.userFormKey,
                        child: ListView(
                          children: [
                            Text(translation.profilePage.username, style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: Sizes.paddingS,
                            ),
                            UsernameTextFormField(viewModel.username),
                            SizedBox(height: Sizes.padding),
                            Text(translation.profilePage.name, style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w500)),
                            SizedBox(height: Sizes.paddingS),
                            NameTextFormField(viewModel.name),
                            SizedBox(height: Sizes.padding),
                            Text(translation.profilePage.surname, style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w500)),
                            SizedBox(height: Sizes.paddingS),
                            SurnameTextFormField(viewModel.surname),
                            SizedBox(
                              height: Sizes.padding,
                            ),
                            Text(translation.profilePage.email, style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: Sizes.paddingS,
                            ),
                            EmailTextFormField(
                              viewModel.email,
                              enabled: false,
                              readOnly: true,
                              suffixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              onTap: () {
                                if (viewModel.showSnackBar != null) {
                                  viewModel.showSnackBar!(
                                    "Al momento non è possibile modificare l'email!",
                                  );
                                }
                              },
                            ),
                            SizedBox(
                              height: Sizes.padding,
                            ),
                            Text(translation.profilePage.city, style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: Sizes.paddingS,
                            ),
                            CityTextFormField(viewModel.city),
                            SizedBox(
                              height: Sizes.paddingM,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: Sizes.padding * 2),
                              child: ElevatedButton(
                                onPressed: () async => viewModel.onSaveClick(),
                                child: Text(translation.generic.save),
                              ),
                            ),
                            SizedBox(
                              height: Sizes.padding,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (viewModel.showPageLoader) CustomCircularProgressIndicator()
            ],
          );
        },
      ),
    );
  }
}
