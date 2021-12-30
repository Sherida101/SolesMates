import 'package:flutter/material.dart';

class Constants {
  // Videos
  static const String backgroundvid = 'assets/videos/solesmatesvideo.mp4';

  static const String currencySymbol = '£';
  static const String google = 'assets/images/google.png';

  // Category icons
  static const String babyShoesCategoryIcon = 'assets/icons/babyShoesIcon.svg';
  static const String bootsCategoryIcon = 'assets/icons/bootsIcon.svg';
  static const String casualShoesIcon = 'assets/icons/casualShoesIcon.svg';
  static const String flatShoesCategoryIcon = 'assets/icons/flatShoesIcon.svg';
  static const String heelsCategoryIcon = 'assets/icons/heelsIcon.svg';
  static const String sandalsCategoryIcon = 'assets/icons/sandalsIcon.svg';
  static const String schoolShoesCategoryIcon = 'assets/icons/schoolShoesIcon.svg';
  static const String slippersCategoryIcon = 'assets/icons/slippersIcon.svg';
  static const String sneakersCategoryIcon = 'assets/icons/sneakersIcon.svg';
  static const String wedgesCategoryIcon = 'assets/icons/wedgesIcon.svg';

  // UI Helper
  static const double _horizontalSpaceExtraSmall = 4;
  static const double _horizontalSpaceSmall = 8.0;
  static const double _horizontalSpaceMedium = 16.0;

  static const double _verticalSpaceExtraSmall = 4.0;
  static const double _verticalSpaceSmall = 8.0;
  static const double _verticalSpaceMedium = 16.0;
  static const double _verticalSpaceLarge = 24.0;
  static const double _verticalSpaceExtraLarge = 48;

  static SizedBox horizontalSpaceExtraSmall() =>
      horizontalSpace(_horizontalSpaceExtraSmall);
  static SizedBox horizontalSpaceSmall() =>
      horizontalSpace(_horizontalSpaceSmall);
  static SizedBox horizontalSpaceMedium() =>
      horizontalSpace(_horizontalSpaceMedium);
  static SizedBox horizontalSpace(double width) => SizedBox(width: width);

  static SizedBox verticalSpaceExtraSmall() =>
      verticalSpace(_verticalSpaceExtraSmall);
  static SizedBox verticalSpaceSmall() => verticalSpace(_verticalSpaceSmall);
  static SizedBox verticalSpaceMedium() => verticalSpace(_verticalSpaceMedium);
  static SizedBox verticalSpaceLarge() => verticalSpace(_verticalSpaceLarge);
  static SizedBox verticalSpaceExtraLarge() =>
      verticalSpace(_verticalSpaceExtraLarge);
  static SizedBox verticalSpace(double height) => SizedBox(height: height);
}
