import 'package:flutter/material.dart';
import '../utils/AppsConstants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecommendedCard extends StatelessWidget {
  final Map<String, dynamic> place;

  const RecommendedCard({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.recommendedCardWidth,
      margin: const EdgeInsets.only(right: AppDimensions.spacingMedium),
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppDimensions.borderRadiusMedium),
                ),
                child: CachedNetworkImage(
                  imageUrl: place['imageUrl']!,
                  height: AppDimensions.recommendedCardImageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),errorWidget:  (context, url, error) => Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppDimensions.spacingSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          place['price'],
                          style: TextStyle(
                            fontSize: AppDimensions.textLarge,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimaryColor,
                          ),
                        ),
                        const SizedBox(width: AppDimensions.spacingExtraSmall),
                        Text(
                          "/ ${place['day']}",
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
                      ],
                    ),
                    const SizedBox(height: AppDimensions.spacingExtraSmall),
                    Text(
                      place['title']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: AppDimensions.textMedium,
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
          Positioned(
            top: AppDimensions.recommendedCardImageHeight + 10,
            right: AppDimensions.spacingSmall,
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.redAccent, size: 14),
                Text(
                  " ${place['rating']}",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Positioned(
            top: AppDimensions.spacingSmall,
            right: AppDimensions.spacingSmall,
            child: Container(
              padding: const EdgeInsets.all(AppDimensions.spacingExtraSmall),
              decoration: BoxDecoration(
                color: AppColors.iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_border,
                color: AppColors.iconColor,
              ),
            ),
          ),
        ],
      ),
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
