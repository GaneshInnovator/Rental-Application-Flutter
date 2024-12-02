import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = "Rental App";

  static const String exploreText = "Explore the world! By Travelling";
  static const String searchHintText = "Where did you go?";
  static const String popularLocationsText = "Popular locations";
  static const String recommendedText = "Recommended";
  static const String mostViewedText = "Most viewed";
  static const String hostingFeeText = "Hosting Fee for as low as 1%";
  static const String becomeHostButtonText = "Become a Host";

  static const Color headerBackgroundColor = Color(0xFFF8F7FD);
  static const Color greyColor = Color(0xFF868B88);
  static const Color starColor = Colors.amber;

  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subHeadingTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle locationNameStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
}

class AppColors {
  static const Color cardBackgroundColor = Colors.white;
  static const Color textPrimaryColor = Colors.black;
  static const Color textSecondaryColor = Colors.grey;
  static const Color iconBackgroundColor = Colors.white;
  static const Color iconColor = Color(0xFF868B88);
}

class AppDimensions {
  static double getRecommendedCardWidth(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.6;

  static double getRecommendedCardImageHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.2;

  static double getDefaultPadding(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04;

  static double getCardRadius(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.03;

  static double getSearchHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.07;

  static double getSpacingSmall(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.02;

  static double getSpacingMedium(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04;

  static double getSpacingExtraSmall(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.01;

  static double getTextLarge(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.05;

  static double getTextMedium(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.035;

  static double getIconSmall(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04;
}
