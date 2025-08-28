import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Model/Prodact_Model.dart';
import 'package:onlinegroceriesapp/Controller/Shop_controller.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryName;

  const ProductListScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final ShopController controller = Get.find<ShopController>();

    // فلترة المنتجات حسب الكاتيجوري
    final List<ProducatModel> filteredProducts = controller.product
        .where((product) => product.category.contains(categoryName)  )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
      ),
      body: filteredProducts.isEmpty
          ? const Center(child: Text("No products found in this category"))
          : ListView.builder(
              itemCount:filteredProducts.length ,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ListTile(
                  leading: Image.asset(product.image, height: 50),
                  title: Text(product.name),
                  subtitle: Text("\$${product.price}"),
                );
              },
            ),
    );
  }
}
