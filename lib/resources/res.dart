import 'package:flutter/material.dart' show Color, Colors, MaterialColor;

class Sizes {
  static const paddingXS = 4.0;
  static const paddingS = 8.0;
  static const padding = 16.0;
  static const paddingM = 32.0;
  static const paddingL = 42.0;
  static const paddingXL = 56.0;
  static const paddingXXL = 88.0;
  static const loginLayoutPadding = 44.0;

  static const minButtonHeight = 48.0;
  static const minButtonWidth = 256.0;

  static const titleFontSize = 32.0;
  static const body2FontSize = 14.0;
  static const body1FontSize = 16.0;
  static const fontSizeS = 18.0;
  static const captionFontSize = 12.0;
  static const fontSize = 20.0;
  static const fontSizeL = 22.0;
  static const fontSizeXXL = 26.0;
  static const subtitleFontSize = 20.0;

  static const borderRadiusXS = 5.0;
  static const borderRadiusS = 10.0;
  static const borderRadius = 30.0;
  static const buttonBorderRadius = 22.0;
  static const textFormFieldRadius = 22.0;

  static const chipIcon = 16.0;
  static const listTileIcon = 20.0;
  static const standardIcon = 25.0;
  static const mediumIconSize = 36.0;
  static const bigIconSize = 48.0;
  static const logoHeight = 100.0;
  static const illustrationHeight = 120.0;

  static const height = 50.0;
  static const heightRatingGradient = 500.0;
  static const heightRatingGradientDash = 3.0;
  static const heightSliverAppBarCollpsedFactor = 0.20;
  static const heightSliverAppBarExtendedFactor = 0.32;
  static const heightSubContainerDetailHeader = 45.0;
  static const heightRatingTile = 10.0;
  static const registryGoogleMapHeight = 100.0;
  static const autocompleteMaxHeight = 250.0;

  static const width10 = 10.0;
  static const widthExpansionRatingTileCircle = 50.0;
  static const widthRatingGradient = 6.0;
  static const widthRatingGradientDash = 10.0;
  static const widthSubContainerDetailHeader = 45.0;
  static const widthRatingTile = 10.0;

  static const registryGoogleMapZoom = 15.0;
  static const opacityDetailHeader = 0.4;
  static const iconSize = 25.0;
  static const normalIcon = 20.0;

  static const headerOpacity = 0.6;

  static const elevatedButtonOutlineBorder = 3.0;

  static const maxImageBytes = 700000;
  static const maxImageBytesBig = 1000000;

  static const double homeLogoHeight = 40.0;
  static const double appBarLogoHeight = 30.0;

  static const double containerShadowBlurRadius = 4.0;
  static const double containerShadowOffsetX = 0.0;
  static const double containerShadowOffsetY = 4.0;

  static const double iconContainerIconSize = 35.0;

  static const double selectButtonHeight = 35.0;
  static const double eventLastNewsTileHeight = 250.0;
  static const int eventLastNewsTileImageFlex = 2;
  static const double eventLastEventTileHeight = 120.0;
  static const double eventLastEventTileImageHeight = 120.0;
  static const double eventLastEventTileImageWidth = 90.0;

  static const int fromMillisecondsSinceEpoch = 1000;

  static const double profileCircleAvatarRadius = 50.0;
  static const double profileCircleAvatarRadiusSmall = 35.0;

  static const double listTileSwitchScale = .8;

  static const double googleMapHeight = 250.0;
  static const double googleMapInitialCameraPositionZoom = 12.4746;
  static const double googleMapMarkersZoomPadding = 40.0;

  static const double trashTypeButtonBorderWidth = 2.0;
  static const int trashTypeButtonContainerAnimationDuration = 300;
  static const double trashTypeButtonHeight = 35.0;

  static const double consumerButtonHeight = 35.0;
  static const double consumerButtonBorderWidth = 2.0;
  static const int consumerButtonContainerAnimation = 200;

  static const double lastNewsListHeight = 170.0;
  static const double calendarDayHeight = 45.0;
  static const double calendarDayWidth = 45.0;

  static const int servicesPageContainerAnimationDuration = 100;
  static const int servicesPageArrowAnimationDuration = 200;
  static const int servicesPageCardFirstFlexBags = 4;
  static const int servicesPageCardSecondFlexBags = 3;
  static const double servicesPageCardKitWidth = 185.0;

  static const double myOrchardItemWidth = 35.0;

  //Users
  static const double usersSearchBarHeight = 35.0;
  static const double usersSearchBarWidth = 185;

  static const double userCardHeight = 145;

  static const double userDetailImageHeight = 250;

  //POST
  static const double postHeight = 250;

  //TREE
  static const double treeCardHeight = 270.0;

  static const int standardAnimationDuration = 150;
}

class ImageSrc {
  static const logo = "assets/images/logo.png";
  static const longLogo = "assets/images/long_logo.png";
  static const bigLogo = "assets/images/big_logo.png";
  static const splash = "assets/images/splash.png";
  static const illustrationOne = "assets/images/placeholder_1.png";
  static const illustrationTwo = "assets/images/placeholder_2.png";
  static const illustrationThree = "assets/images/placeholder_3.png";
  static const illustrationFour = "assets/images/placeholder_4.png";
  static const introImage = "assets/images/empty.png";
  static const accessImageBackground = "assets/images/empty.png";
  static const registrationSuccessImage = "assets/images/check_email.png";
}

class AvatarSrc {
  static const avatar1 = "assets/avatars/avatar_1.png";
  static const avatar2 = "assets/avatars/avatar_2.png";
  static const avatar3 = "assets/avatars/avatar_3.png";
}

class IconSvgSrc {}

class BaseProjectConst {
  static const NORMAL_TEXTFORMFIELD_MAX_LENGTH = 40;
  static const EMAIL_TEXTFORMFIELD_MAX_LENGTH = 100;
  static const PLACEHOLDER = r'##';
}

class AppColors {
  static const primaryColor = Color.fromRGBO(203, 47, 104, 1);
  static const primaryColorDark = Color.fromRGBO(1, 166, 115, 1);
  static const lightOrange = Color.fromRGBO(255, 235, 221, 1);
  static const secondaryColor = Color.fromRGBO(97, 73, 251, 1);
  static const secondaryColorDark = Color.fromRGBO(167, 115, 1, 1);
  static const backgroundColor = Color.fromRGBO(0, 15, 48, 1);
  static const appBarBackgroundColor = Color.fromRGBO(30, 42, 66, 1);
  static const appBarElementsColor = Colors.white;
  static const darkModeBackgroundColor = Color.fromRGBO(0, 15, 48, 1);
  static const navigationBarColor = Color.fromRGBO(39, 50, 71, 1);
  static const navigationBarUnselectedIconColor = Color.fromRGBO(210, 212, 215, 1);
  static const linearGraphBarColor = Color(0xffD2D2D2);
  static const postCardColor = Color.fromRGBO(39, 50, 71, 1);
  static const postCardDescriptionTextColor = Color.fromRGBO(212, 212, 212, 1);
  static const _primaryColorInt = 0xFF1146a9;
  static const _primaryColorR = 17;
  static const _primaryColorG = 70;
  static const _primaryColorB = 169;
  static const accentColor = Color(0xFF00afec);
  static const primaryTextColor = Colors.white;
  static const gray = Color(0xFF47546d);
  static const darkGray = Color(0xFF51564A);
  static const red = Color(0xFFAA0000);
  static const duckEggBlue = Color(0xFFF0F6FC);
  static const paleGrey = Color(0xFFf2f3f7);
  static const placeholderColor = Color(0xFF47546d);
  static const blueyGray = Color(0xFF93a1bc);
  static const white = Colors.white;
  static const transparentWhite = Color(0x00FFFFFF);
  static const snow = Color(0xFFF9F9F9);
  static const shuttleGrey = Color(0xFFF656667);
  static const gray90 = Color(0xFFFE5E5E5);
  static const facebook = Color.fromARGB(255, 9, 87, 152);
  static const whatsapp = Colors.teal;
  static const statusNew = Colors.blue;
  static const statusOnSale = Colors.amber;

  //Users

  //----Users SearchBar
  static const usersSearchBarColor = Color.fromARGB(255, 208, 207, 207);
  static const usersSearchBarCircularAvatarColor = Colors.red;

  static MaterialColor get primaryMaterialColor => MaterialColor(_primaryColorInt, {
        50: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .1),
        100: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .2),
        200: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .3),
        300: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .4),
        400: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .5),
        500: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .6),
        600: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .7),
        700: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .8),
        800: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .9),
        900: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, 1),
      });
}
