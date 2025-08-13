import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Controller/Shop_controller.dart';
import 'package:onlinegroceriesapp/Custom/CustomText.dart';
import 'package:onlinegroceriesapp/Model/Prodact_Model.dart';
import 'package:onlinegroceriesapp/theme/Image.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShopController());
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage(Assets.assetsImageBanner ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Exclusive Offer
          sectionTitle("Exclusive Offer"),
          const SizedBox(height: 12),
          Row(
            children: controller.exclusiveOffers
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
            children: controller.bestSelling
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
            children: controller.bestSelling
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
    );
  }

  Widget sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: title,size: 24,boold: FontWeight.bold,),
        CustomText(text: 'See    all',size: 16,color: Colors.green,boold: FontWeight.bold,),
        
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
          Image.asset(product.image, height: 62,width: 103,),
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
             CustomText(text: product.price,size: 18,boold: FontWeight.bold,),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green,
                child: const Icon(Icons.add, size: 17, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
