import 'package:flutter/material.dart';
import '../utils/AppsConstants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LocationCard extends StatelessWidget {
  final Map<String, String> location;

  const LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppConstants.spacingBetweenElements),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.cardRadius), // Rounded corners for the card
        child: Stack(
          children: [

            CachedNetworkImage(
              imageUrl: location['imageUrl']!,
              width: 110,
              height: 150,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),errorWidget:  (context, url, error) => Icon(Icons.error),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 6),
                color: Colors.transparent,
                child: Text(
                  location['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
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
