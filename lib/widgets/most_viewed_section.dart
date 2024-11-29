import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/AppsConstants.dart';

class MostViewedSection extends StatelessWidget {
  const MostViewedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.mostViewedText,
          style: AppConstants.subHeadingTextStyle,
        ),
        const SizedBox(height: 16),
        // Displaying most viewed places dynamically
        for (var place in viwedPlaces)
          Padding(
            padding: const EdgeInsets.only(bottom: AppConstants.spacingBetweenElements), // Space between items
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.cardRadius),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        place['imageUrl']!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite_border,
                            color: AppConstants.greyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              place['price']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              ' / ${place['day']}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Adding the yellow polygon here next to the rating
                            CustomPaint(
                              size: Size(8, 8), // Size of the polygon
                              painter: PolygonPainter(),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.star,
                              color: Colors.redAccent,
                              size: 14,
                            ),
                            Text(
                              ' ${place['rating']}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        // Title
                        Text(
                          place['title']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          place['detail']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// PolygonPainter class to draw the polygon shape
class PolygonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.yellow // Set the polygon color to yellow
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(size.width * 0.25, size.height * -1) // Starting point
      ..lineTo(size.width * 0, size.height * -0.25)
      ..lineTo(size.width * 0.5, size.height * 0)
      ..lineTo(size.width * -0.25, size.height * 1)
      ..lineTo(size.width * 0, size.height * 0.25)
      ..lineTo(size.width * -0.5, size.height * 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}