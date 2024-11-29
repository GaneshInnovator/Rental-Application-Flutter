import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/AppsConstants.dart';

class AdsSection extends StatelessWidget {
  const AdsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var ad in adsImages) // Loop through adsImages
          Padding(
            padding: const EdgeInsets.only(bottom: AppConstants.spacingBetweenElements), // Spacing between ads
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.cardRadius),
                child: Stack(
                  children: [
                    // Ad image with adjusted width (70%) and centered
                    Image.network(
                      ad['imageUrl']!,
                      height: 220,
                      width: MediaQuery.of(context).size.width * 0.8, // 70% of screen width
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 16,
                      top: 16,
                      child: Text(
                        AppConstants.hostingFeeText,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 1),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(AppConstants.becomeHostButtonText, style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
