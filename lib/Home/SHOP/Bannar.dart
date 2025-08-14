// import 'package:flutter/material.dart';
// import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
// import 'package:onlinegroceriesapp/theme/Image.dart';


// class WidgetBanner extends StatelessWidget {
//   final List<String> images = [
//    Assets.assetsImageBanner,
//    Assets.assetsImage2771,
//    Assets.assetsImageMask,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return FlutterCarousel(
//       options: FlutterCarouselOptions(
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 2),
//         height: 170.0,
//         showIndicator: true,
//         slideIndicator: CircularSlideIndicator(
//             slideIndicatorOptions: SlideIndicatorOptions(
//           indicatorBackgroundColor: isDark ? Colors.white30 : Colors.grey[300]!,
//           currentIndicatorColor: isDark ? Colors.white : Colors.black,
//         )),
//       ),
//       items: images.map((imagePath) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(25),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: isDark ? Colors.grey[800] : Colors.grey[200],
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         blurRadius: 6,
//                         offset: const Offset(3, 3),
//                       )
//                     ],
//                   ),
//                   child: Image.asset(
//                     imagePath,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       }).toList(),
//     );
//   }
// }
