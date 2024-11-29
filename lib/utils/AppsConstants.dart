import 'package:flutter/material.dart';

class AppConstants {
  // App Information
  static const String appName = "Rental App";

  // Texts
  static const String exploreText = "Explore the world! By Travelling";
  static const String searchHintText = "Where did you go?";
  static const String popularLocationsText = "Popular locations";
  static const String recommendedText = "Recommended";
  static const String mostViewedText = "Most viewed";
  static const String hostingFeeText = "Hosting Fee for as low as 1%";
  static const String becomeHostButtonText = "Become a Host";

  // Dimensions
  static const double defaultPadding = 16.0;
  static const double cardRadius = 12.0;
  static const double searchHeight = 50.0;
  static const double spacingBetweenElements = 16.0;

  // Colors
  static const Color headerBackgroundColor = Color(0xFFF8F7FD);
  static const Color greyColor = Color(0xFF868B88);
  static const Color starColor = Colors.amber;

  // Text Styles
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
  static const double recommendedCardWidth = 250.0;
  static const double recommendedCardImageHeight = 150.0;
  static const double borderRadiusMedium = 12.0;
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingExtraSmall = 4.0;
  static const double textLarge = 18.0;
  static const double textMedium = 14.0;
  static const double iconSmall = 16.0;
}
