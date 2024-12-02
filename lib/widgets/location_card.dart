import 'package:flutter/material.dart';
import '../utils/AppsConstants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LocationCard extends StatelessWidget {
  final Map<String, String> location;

  const LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.04),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: location['imageUrl']!,
              width: screenWidth * 0.3,
              height: screenHeight * 0.2,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.007),
                color: Colors.transparent,
                child: Text(
                  location['name']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
