import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Controller/Card_Controller.dart';
import 'package:onlinegroceriesapp/Controller/Shop_controller.dart';
import 'package:onlinegroceriesapp/Custom/CustomBannar.dart';
import 'package:onlinegroceriesapp/Custom/CustomText.dart';
import 'package:onlinegroceriesapp/Custom/Custom_TextButton.dart';
import 'package:onlinegroceriesapp/Home/SHOP/Product-Detail.dart';
import 'package:onlinegroceriesapp/Model/Prodact_Model.dart';
import 'package:onlinegroceriesapp/theme/Image.dart';

class Shop extends StatelessWidget {
  final int? id;
  Shop({super.key,  this.id});

  @override
  Widget build(BuildContext context) { 
    //  final cartController = Get.put(CartController());
    // final controller = Get.put(ShopController());

    return 
    GetBuilder<ShopController>(
      init: ShopController(),
      builder: (controller) {
        
         if (controller.product.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return
      
       SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Banner
            CustomBaannar(
              images: [
                Assets.imageBanner,
                Assets.imageApple,
              ],
              height: 120,
              secoonds: 4,
            ),
          
            const SizedBox(height: 20),
      
            // Exclusive Offer
            sectionTitle("Exclusive Offer"),
            const SizedBox(height: 12),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:controller.getExclusive().take(1)
                  .map((item) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: productCard(item),
                        ),
                      ))
                  .toList(),
                  
            ),
            
            const SizedBox(height: 20),
      
            // Best Selling
            sectionTitle("Best Selling"),
            const SizedBox(height: 12),
            Row(
           
              children:controller.getBestSelling()
                  .map((item) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: productCard(item),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
      
            // Groceries
            sectionTitle("Grocmmmmmeries"),
            const SizedBox(height: 12),
            Row(
              children: controller.getGroceries()
                  .map((item) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: productCard(item),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      );}
    );
  }

  Widget sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          size: 24,
          boold: FontWeight.bold,
        ),
        CustomTextButtom(
            text: 'See all',
            color: Colors.green,
            size: 16,
            onpressed: () {
              print('1');
            })
      ],
    );
  }

 Widget productCard(ProducatModel product) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 5,
          spreadRadius: 1,
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          product.image,
          height: 62,
          width: 103,
        ),
        const SizedBox(height: 8),
        CustomText(
          text: product.name,
          size: 18,
          boold: FontWeight.bold,
        ),
        CustomText(
          text: product.description,
          size: 14,
        ),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "\$${product.price.toString()}",
              size: 18,
              boold: FontWeight.bold,
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Get.to(() => ProductDetails(product: product));
              },
              backgroundColor: Colors.green,
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: const Icon(Icons.add, size: 20, color: Colors.white),
            )
          ],
        ),
      ],
    ),
  );
}
}
