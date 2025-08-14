import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Controller/Shop_controller.dart';
import 'package:onlinegroceriesapp/Custom/CustomText.dart';

class ProductDetails extends StatelessWidget {
  final int id;
  const ProductDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShopController>();
    final product = controller.getProductById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(product.image, height: 150),
            const SizedBox(height: 16),
            CustomText(
              text: product.name,
              size: 24,
              boold: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            CustomText(
              text: product.description,
              size: 16,
            ),
            const Spacer(),
            CustomText(
              text: product.price,
              size: 22,
              boold: FontWeight.bold,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                print("Added to cart");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              ),
              child: const Text("Add to Cart", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
