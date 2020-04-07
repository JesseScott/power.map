import 'package:flutter/material.dart';

import 'Dimensions.dart';


class Style {
  static const String AmaranthFont = 'Amaranth';
  static const String DosisFont = 'Dosis';

  // region - AppBar

  static const TitleTextStyle = TextStyle(
    fontFamily: AmaranthFont,
    fontWeight: FontWeight.w300,
    fontSize: Dimensions.large_text_size,
    color: Colors.white,
  );

  static const SubtitleTextStyle = TextStyle(
    fontFamily: AmaranthFont,
    fontWeight: FontWeight.w300,
    fontSize: Dimensions.medium_text_size,
    color: Colors.white,
  );

  static const BodyTextStyle = TextStyle(
    fontFamily: AmaranthFont,
    fontWeight: FontWeight.w300,
    fontSize: Dimensions.body_text_size,
    color: Colors.white,
  );

  // endregion

  // region - Onboarding

  static const OnboardingHeaderTextStyle = TextStyle(
    fontFamily: AmaranthFont,
    fontWeight: FontWeight.w300,
    fontSize: Dimensions.huge_text_size,
    color: Colors.white,
  );

  static const OnboardingTitleTextStyle = TextStyle(
    fontFamily: AmaranthFont,
    fontWeight: FontWeight.w300,
    fontSize: Dimensions.large_text_size,
    color: Colors.white,
  );

  static const OnboardingSubtitleTextStyle = TextStyle(
    fontFamily: AmaranthFont,
    fontWeight: FontWeight.w300,
    fontSize: Dimensions.medium_text_size,
    color: Colors.white,
  );

  static const PagerTextStyle = TextStyle(
    fontFamily: DosisFont,
    fontWeight: FontWeight.w100,
    fontSize: Dimensions.medium_text_size,
    color: Colors.white,
  );

  static const TutorialBodyTextStyle = TextStyle(
    fontFamily: AmaranthFont,
    fontWeight: FontWeight.w300,
    fontSize: Dimensions.large_text_size,
    color: Colors.white,
  );

  // endregion



  static const BasePadding = EdgeInsets.all(Dimensions.base_padding);


// endregion

}
