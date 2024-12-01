import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/AppsConstants.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        for (var place in viwedPlaces)
          Padding(
            padding: const EdgeInsets.only(bottom: AppConstants.spacingBetweenElements), 
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.cardRadius),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: place['imageUrl']!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => CircularProgressIndicator(),errorWidget:  (context, url, error) => Icon(Icons.error),
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
                            CustomPaint(
                              size: Size(8, 8),
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

class PolygonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(size.width * 0.25, size.height * -1)
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
