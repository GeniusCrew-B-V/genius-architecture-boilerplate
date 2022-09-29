import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../resources/res.dart';

final _textFormFieldBorder = UnderlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(Sizes.textFormFieldRadius),
  ),
  borderSide: BorderSide(
    width: 0,
    color: Colors.transparent,
    style: BorderStyle.none,
  ),
);
final _fontFamily = 'Nunito';

class MyAppTheme {
  static getLightMode(Color? primaryColor) {
    return ThemeData(
      useMaterial3: true,
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.navigationBarColor,
          indicatorColor: AppColors.primaryColor,
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontFamily: _fontFamily);
            }
            return TextStyle(color: AppColors.navigationBarUnselectedIconColor, fontFamily: _fontFamily);
          }),
          iconTheme: MaterialStateProperty.all(IconThemeData(color: AppColors.navigationBarUnselectedIconColor))),
      brightness: Brightness.light,
      primaryColor: primaryColor ?? AppColors.primaryColor,
      backgroundColor: AppColors.backgroundColor,
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        textStyle: ThemeData().primaryTextTheme.button!.copyWith(fontFamily: _fontFamily, fontSize: Sizes.fontSizeS, color: AppColors.primaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.buttonBorderRadius)),
        backgroundColor: AppColors.backgroundColor,
        side: BorderSide(color: AppColors.primaryColor),
        minimumSize: Size(
          double.infinity,
          Sizes.minButtonHeight,
        ),
      )),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: ThemeData().primaryTextTheme.button!.copyWith(
                decoration: TextDecoration.underline,
              ),
          minimumSize: Size(
            double.infinity,
            Sizes.minButtonHeight,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.buttonBorderRadius)),
          primary: AppColors.primaryColor,
          onPrimary: AppColors.white,
          minimumSize: Size(
            double.infinity,
            Sizes.minButtonHeight,
          ),
        ),
      ),
      fontFamily: _fontFamily,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0.7,
        color: AppColors.appBarBackgroundColor,
        iconTheme: IconThemeData().copyWith(
          color: AppColors.appBarElementsColor,
        ),
        centerTitle: true,
        toolbarTextStyle: ThemeData()
            .primaryTextTheme
            .apply(
              bodyColor: AppColors.appBarElementsColor,
            )
            .bodyText2,
        titleTextStyle: ThemeData().primaryTextTheme.headline6!.copyWith(fontFamily: _fontFamily, color: AppColors.appBarElementsColor),
      ),
      checkboxTheme: CheckboxThemeData(
        side: MaterialStateBorderSide.resolveWith((_) => const BorderSide(width: 1, color: AppColors.darkGray)),
        fillColor: MaterialStateProperty.all(AppColors.primaryColor),
      ),
      textTheme: ThemeData()
          .primaryTextTheme
          .apply(
            fontFamily: _fontFamily,
            bodyColor: AppColors.primaryTextColor,
            displayColor: AppColors.primaryTextColor,
          )
          .copyWith(
              button: ThemeData().primaryTextTheme.button!.copyWith(
                    fontFamily: _fontFamily,
                    fontSize: Sizes.fontSize,
                    fontWeight: FontWeight.w600,
                  ),
              subtitle1: ThemeData().primaryTextTheme.button!.copyWith(fontFamily: _fontFamily, color: Colors.black)),
      inputDecorationTheme: ThemeData().inputDecorationTheme.copyWith(
            labelStyle: ThemeData().primaryTextTheme.bodyText2!.copyWith(
                  fontFamily: _fontFamily,
                  color: AppColors.placeholderColor,
                ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: AppColors.paleGrey,
            focusedErrorBorder: _textFormFieldBorder,
            errorBorder: _textFormFieldBorder,
            focusedBorder: _textFormFieldBorder,
            enabledBorder: _textFormFieldBorder,
          ),
      dialogTheme: DialogTheme(
          titleTextStyle: ThemeData().primaryTextTheme.headline6!.copyWith(
                fontFamily: _fontFamily,
                color: Colors.black,
              )),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.primaryMaterialColor).copyWith(primary: AppColors.primaryColor, secondary: AppColors.secondaryColor, brightness: Brightness.light),
    );
  }

  static getDarkMode(Color? primaryColor) {
    return ThemeData(
      useMaterial3: true,
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.navigationBarColor,
          indicatorColor: AppColors.primaryColorDark,
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return TextStyle(color: AppColors.primaryColorDark, fontWeight: FontWeight.bold, fontFamily: _fontFamily);
            }
            return TextStyle(color: AppColors.navigationBarUnselectedIconColor, fontFamily: _fontFamily);
          }),
          iconTheme: MaterialStateProperty.all(IconThemeData(color: AppColors.navigationBarUnselectedIconColor))),
      brightness: Brightness.light,
      primaryColor: primaryColor ?? AppColors.primaryColorDark,
      backgroundColor: AppColors.backgroundColor,
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        textStyle: ThemeData().primaryTextTheme.button!.copyWith(fontFamily: _fontFamily, fontSize: Sizes.fontSizeS, color: AppColors.primaryColorDark),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.buttonBorderRadius)),
        backgroundColor: AppColors.backgroundColor,
        side: BorderSide(color: AppColors.primaryColorDark),
        minimumSize: Size(
          double.infinity,
          Sizes.minButtonHeight,
        ),
      )),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: ThemeData().primaryTextTheme.button!.copyWith(
                decoration: TextDecoration.underline,
              ),
          minimumSize: Size(
            double.infinity,
            Sizes.minButtonHeight,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.buttonBorderRadius)),
          primary: AppColors.primaryColorDark,
          onPrimary: AppColors.white,
          minimumSize: Size(
            double.infinity,
            Sizes.minButtonHeight,
          ),
        ),
      ),
      fontFamily: _fontFamily,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0.7,
        color: AppColors.appBarBackgroundColor,
        iconTheme: IconThemeData().copyWith(
          color: AppColors.appBarElementsColor,
        ),
        centerTitle: true,
        toolbarTextStyle: ThemeData()
            .primaryTextTheme
            .apply(
              bodyColor: AppColors.appBarElementsColor,
            )
            .bodyText2,
        titleTextStyle: ThemeData().primaryTextTheme.headline6!.copyWith(fontFamily: _fontFamily, color: AppColors.appBarElementsColor),
      ),
      checkboxTheme: CheckboxThemeData(
        side: MaterialStateBorderSide.resolveWith((_) => const BorderSide(width: 1, color: AppColors.darkGray)),
        fillColor: MaterialStateProperty.all(AppColors.primaryColorDark),
      ),
      textTheme: ThemeData()
          .primaryTextTheme
          .apply(
            fontFamily: _fontFamily,
            bodyColor: AppColors.primaryTextColor,
            displayColor: AppColors.primaryTextColor,
          )
          .copyWith(
              button: ThemeData().primaryTextTheme.button!.copyWith(
                    fontFamily: _fontFamily,
                    fontSize: Sizes.fontSize,
                    fontWeight: FontWeight.w600,
                  ),
              subtitle1: ThemeData().primaryTextTheme.button!.copyWith(fontFamily: _fontFamily, color: Colors.black)),
      inputDecorationTheme: ThemeData().inputDecorationTheme.copyWith(
            labelStyle: ThemeData().primaryTextTheme.bodyText2!.copyWith(
                  fontFamily: _fontFamily,
                  color: AppColors.placeholderColor,
                ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: AppColors.paleGrey,
            focusedErrorBorder: _textFormFieldBorder,
            errorBorder: _textFormFieldBorder,
            focusedBorder: _textFormFieldBorder,
            enabledBorder: _textFormFieldBorder,
          ),
      colorScheme:
          ColorScheme.fromSwatch(primarySwatch: AppColors.primaryMaterialColor).copyWith(primary: AppColors.primaryColorDark, secondary: AppColors.secondaryColorDark, brightness: Brightness.light),
    );
  }
}
