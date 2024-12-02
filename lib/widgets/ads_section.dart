import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/AppsConstants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AdsSection extends StatelessWidget {
  const AdsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var ad in adsImages)
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: ad['imageUrl']!,
                      height: screenHeight * 0.38,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                    Positioned(
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.02,
                      child: Text(
                        AppConstants.hostingFeeText,
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
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
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.06,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.05),
                          ),
                        ),
                        child: Text(
                          AppConstants.becomeHostButtonText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
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
