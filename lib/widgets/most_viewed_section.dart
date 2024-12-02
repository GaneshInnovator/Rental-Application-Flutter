import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/AppsConstants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MostViewedSection extends StatelessWidget {
  const MostViewedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.mostViewedText,
          style: AppConstants.subHeadingTextStyle,
        ),
        SizedBox(height: screenHeight * 0.02),
        for (var place in viwedPlaces)
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(screenWidth * 0.03),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenWidth * 0.03),
                          topRight: Radius.circular(screenWidth * 0.03),
                          bottomLeft: Radius.circular(screenWidth * 0.03),
                          bottomRight: Radius.circular(screenWidth * 0.03),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: place['imageUrl']!,
                          height: screenHeight * 0.25,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  place['price']!,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Text(
                                  ' / ${place['day']}',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                CustomPaint(
                                  size: Size(screenWidth * 0.02, screenHeight * 0.01),
                                  painter: PolygonPainter(),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.star,
                                  color: Colors.redAccent,
                                  size: screenWidth * 0.035,
                                ),
                                Text(
                                  ' ${place['rating']}',
                                  style: TextStyle(fontSize: screenWidth * 0.03),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              place['title']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              place['detail']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: screenHeight * 0.02,
                    right: screenWidth * 0.03,
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.01),
                      decoration: BoxDecoration(
                        color: AppColors.iconBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: AppColors.iconColor,
                        size: screenWidth * 0.08,
                      ),
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
