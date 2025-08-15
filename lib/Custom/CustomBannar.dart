import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class CustomBaannar extends StatelessWidget {
  final List<String> images;
  final double? secoonds;
  final double? height;
  const CustomBaannar(
      {super.key, required this.images, this.secoonds, this.height});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return FlutterCarousel(
      options: FlutterCarouselOptions(
        autoPlay: true,
        autoPlayInterval:
            Duration(seconds: (secoonds == null ? 3 : secoonds)!.toInt()),
        height: height,
        showIndicator: true,
        slideIndicator:
         CircularSlideIndicator(
            slideIndicatorOptions: SlideIndicatorOptions(
          indicatorBackgroundColor: isDark ? Colors.white30 : Colors.grey[300]!,
          currentIndicatorColor: isDark ? Colors.white : Colors.green,
        )),
      ),
      items: images.map((image) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image, // استخدم Image.network(image) إذا كانت روابط انترنت
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
    );
  }
}
