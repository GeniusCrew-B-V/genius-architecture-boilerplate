import 'package:baseproject/src/base/widget/models/tutorial_widget_model.dart';
import 'package:flutter/material.dart';

import '../../../../i18n/translations.dart';
import '../../../../resources/res.dart';

class TutorialWidget extends StatelessWidget {
  final Function(int) onPlaceHoldersPressed;
  final int currentPlaceholder;
  final List<TutorialWidgetModel> models;
  final Function() onEnd;
  TutorialWidget({
    required this.models,
    required this.onPlaceHoldersPressed,
    required this.currentPlaceholder,
    required this.onEnd,
  });

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (val) => onPlaceHoldersPressed(val),
              children: List.generate(
                models.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(Sizes.padding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Divider(
                        color: Colors.transparent,
                        height: Sizes.padding,
                      ),
                      models[index].customWidget != null
                          ? models[index].customWidget!
                          : Column(
                              children: [
                                models[index].imagePath != null
                                    ? Image.asset(
                                        models[index].imagePath!,
                                        height: MediaQuery.of(context).size.height / 2.4,
                                      )
                                    : Placeholder(fallbackHeight: MediaQuery.of(context).size.height / 2.4),
                                Divider(
                                  color: Colors.transparent,
                                  height: Sizes.padding,
                                ),
                                Text(
                                  models[index].title, //localizations.welcomeStartPageMessage,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                                ),
                                Divider(
                                  color: Colors.transparent,
                                  height: Sizes.padding,
                                ),
                                Text(
                                  models[index].description, //localizations.welcomeStartPageDescription,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white.withOpacity(0.5)),
                                ),
                              ],
                            ),
                      Divider(
                        color: Colors.transparent,
                        height: Sizes.padding,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: Sizes.padding,
          ),
          Container(
              width: 200,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      models.length,
                      (index) => GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(index, duration: Duration(milliseconds: Sizes.standardAnimationDuration), curve: Curves.easeIn);
                            onPlaceHoldersPressed(index);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: Sizes.standardAnimationDuration),
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(color: currentPlaceholder == index ? Theme.of(context).primaryColor : AppColors.gray90, borderRadius: BorderRadius.circular(25)),
                          ))))),
          const SizedBox(
            height: Sizes.paddingM,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.padding),
            child: ElevatedButton(
              onPressed: () {
                if (currentPlaceholder < models.length - 1) {
                  _pageController.animateToPage(currentPlaceholder + 1, duration: Duration(milliseconds: Sizes.standardAnimationDuration), curve: Curves.easeIn);
                  onPlaceHoldersPressed(currentPlaceholder + 1);
                } else {
                  onEnd();
                }
              },
              child: Text(translation.generic.next),
            ),
          ),
        ],
      ),
    );
  }
}
