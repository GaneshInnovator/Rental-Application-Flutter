import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/location_card.dart';
import '../widgets/recommended_card.dart';
import '../widgets/ads_section.dart';
import '../widgets/most_viewed_section.dart';
import '../utils/Appsconstants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.05,
                ),
                decoration: BoxDecoration(
                  color: AppConstants.headerBackgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.exploreText,
                      style: AppConstants.headerTextStyle,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(screenWidth * 0.05),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: screenWidth * 0.04),
                                const Icon(Icons.search, color: Colors.black87),
                                SizedBox(width: screenWidth * 0.025),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: AppConstants.searchHintText,
                                      hintStyle: TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.025),
                        Container(
                          height: screenHeight * 0.06,
                          width: screenHeight * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(screenWidth * 0.05),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.tune,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      AppConstants.popularLocationsText,
                      style: AppConstants.subHeadingTextStyle,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      child: SizedBox(
                        height: screenHeight * 0.18,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: popularLocations.length,
                          itemBuilder: (context, index) {
                            return LocationCard(location: popularLocations[index]);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      AppConstants.recommendedText,
                      style: AppConstants.subHeadingTextStyle,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      child: SizedBox(
                        height: screenHeight * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recommendedPlaces.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: screenWidth * 0.04),
                              child: RecommendedCard(
                                place: recommendedPlaces[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    const AdsSection(),
                    SizedBox(height: screenHeight * 0.03),

                    const MostViewedSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
