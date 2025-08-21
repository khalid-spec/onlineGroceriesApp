import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Custom/CustomText.dart';
import 'package:onlinegroceriesapp/theme/Image.dart';
// import 'package:flutter_svg/flutter_svg.dart';

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
      {"name": "Beverages", "image": Assets.imageBeverages},
      {"name": "Beverages", "image": Assets.imageJuice},
    ];

    return SizedBox(
      
      height: 650, // ارتفاع كافي لصفين
      child: GridView.builder(
        scrollDirection: Axis.vertical, // أفقي
        itemCount: imageExplore.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // صفين
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 0.9, // نسبة البوكس
        ),
        itemBuilder: (context, index) {
          final image = imageExplore[index];
          return GestureDetector(
            onTap: () => Get.snackbar(
              'Category',
              "You selected ${image['name']}",
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration( border: Border.all(color: Colors.grey.shade400),
                color: Colors.primaries[index % Colors.primaries.length]
                    .withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(5, 5))
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(image['image'] ?? "", height: 70),
                  const SizedBox(height: 10),
                 CustomText(text: image['name']!,boold: FontWeight.bold,color: Colors.primaries[index % Colors.primaries.length].withAlpha(200) ,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
