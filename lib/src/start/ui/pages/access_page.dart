import 'package:baseproject/i18n/translations.dart';
import 'package:baseproject/resources/res.dart';
import 'package:baseproject/src/start/ui/model/start_page_navigator_state.dart';
import 'package:baseproject/src/start/ui/viewmodel/start_page_view_model_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../widgets/start_app_bar.dart';

class AccessPage extends StatefulWidget {
  final StartPageViewModelMain viewModel;
  final Function()? onPop;

  AccessPage(this.viewModel, {required this.onPop});

  @override
  _AccessPageState createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
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

  onWillPop() {
    widget.viewModel.navigationState = StartPageNavigationState.startPage;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Builder(
          builder: (context) {
            widget.viewModel.showSnackBar = (message) => _showSnackbar(context, message);
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Sizes.padding),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SafeArea(
                      child: Container(
                        height: AppBar().preferredSize.height,
                        child: StartAppBar(),
                      ),
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          color: Colors.transparent,
                          height: Sizes.padding,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              ImageSrc.illustrationFour,
                              height: MediaQuery.of(context).size.height / 2.4,
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: Sizes.padding,
                            ),
                            Text(
                              translation.accessPage.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: Sizes.padding,
                            ),
                            Text(
                              translation.accessPage.description,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.transparent,
                          height: Sizes.padding,
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(bottom: Sizes.padding),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () => widget.viewModel.onSignupClick(),
                          child: Text(translation.generic.signup),
                        ),
                      ),
                    ),
                    SizedBox(height: Sizes.paddingS),
                    InkWell(
                      onTap: () => widget.viewModel.onDoYouAlreadyHaveAnAccountClick(),
                      child: Text.rich(
                        TextSpan(children: <InlineSpan>[
                          TextSpan(text: translation.accessPage.doYouAlreadyHaveAnAccount + " ", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(text: translation.accessPage.access, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor))
                        ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: Sizes.paddingM),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void _showSnackbar(BuildContext context, String message) {
  if (message.isNotEmpty) {
    SnackBar snackBar = SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
