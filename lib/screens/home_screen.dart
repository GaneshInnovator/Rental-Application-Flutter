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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                decoration: BoxDecoration(
                  color: AppConstants.headerBackgroundColor,
                  borderRadius: BorderRadius.circular(AppConstants.cardRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.exploreText,
                      style: AppConstants.headerTextStyle,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: AppConstants.searchHeight,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(AppConstants.cardRadius),
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
                                const SizedBox(width: 16),
                                const Icon(Icons.search, color: Colors.grey),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: AppConstants.searchHintText,
                                      hintStyle: TextStyle(color: Colors.grey.shade400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: AppConstants.searchHeight,
                          width: AppConstants.searchHeight,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(AppConstants.cardRadius),
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
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                AppConstants.popularLocationsText,
                style: AppConstants.subHeadingTextStyle,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularLocations.length,
                  itemBuilder: (context, index) {
                    return LocationCard(location: popularLocations[index]);
                  },
                ),
              ),
              const SizedBox(height: 24),
              Text(
                AppConstants.recommendedText,
                style: AppConstants.subHeadingTextStyle,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedPlaces.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: AppConstants.spacingBetweenElements),
                      child: RecommendedCard(
                        place: recommendedPlaces[index],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              const AdsSection(),
              const SizedBox(height: 24),

              const MostViewedSection(),
            ],
          ),
        ),
      ),
    );
  }
}
