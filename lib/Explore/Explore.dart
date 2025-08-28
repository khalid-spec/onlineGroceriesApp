import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Custom/CustomText.dart';
import 'package:onlinegroceriesapp/Explore/ProductListScreen.dart';
import 'package:onlinegroceriesapp/theme/Image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    final imageExplore = [
      {"name": "Fresh Fruits & Vegetable", "image": Assets.imageVagetable},
      {"name": "Cooking Oil & Ghee", "image": Assets.imageOil_chee},
      {"name": "Meat & Fish", "image": Assets.imageTreeTopJuiceAppleGrape64oz},
      {"name": "Bakery & Snacks", "image": Assets.imageEgg},
      {"name": "Dairy & Eggs", "image": Assets.imageEgg},
      {"name": "Beverages", "image": "asset/image/Beverages.svg"},
      {"name": "Beverages", "image": Assets.imageJuice},
    ];

    return SingleChildScrollView(
      // padding: EdgeInsets.all(10),
      child: SizedBox(
        height: 600, // ارتفاع كافي لصفين
        child: GridView.builder(
          scrollDirection: Axis.vertical, // أفقي
          padding: EdgeInsets.all(16),
          itemCount: imageExplore.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // صفين
            mainAxisSpacing: 1 / 1.6,
            crossAxisSpacing: 10,
            childAspectRatio: 1, // نسبة البوكس
          ),
          itemBuilder: (context, index) {
            final image = imageExplore[index];
            final path = image['image'] ?? '';
            return GestureDetector(
              onTap: () =>
              //  Get.snackbar(
              //   'Category',
              //   "You selected ${image['image']}&&",
              // ),
                Get.to(ProductListScreen(categoryName: image['name']!)),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    color: Colors.primaries[index % Colors.primaries.length]
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(5, 5))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildImage(path),
                 
                    const SizedBox(height: 10),
                    CustomText(
                      text: image['name']!,
                      boold: FontWeight.bold,
                      color: Colors.primaries[index % Colors.primaries.length]
                          .withAlpha(200),
                      size: 16,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget buildImage(String path) {
  if (path.endsWith('.svg')) {
    return SvgPicture.asset(
      path,
      height: 70,
      width: 70,
      fit: BoxFit.contain,
    );
  } else {
    return Image.asset(
      path,
      height: 70,
      width: 70,
      fit: BoxFit.fill,
    );
  }
}
