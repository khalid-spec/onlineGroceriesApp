import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Controller/Card_Controller.dart';
import 'package:onlinegroceriesapp/Controller/Shop_controller.dart';
import 'package:onlinegroceriesapp/Custom/CustomText.dart';
import 'package:onlinegroceriesapp/Custom/Custom_IconButtom.dart';
import 'package:onlinegroceriesapp/Home/SHOP/Shop.dart';
import 'package:onlinegroceriesapp/Model/Prodact_Model.dart';

class ProductDetails extends StatelessWidget {
  final int id;
  const ProductDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    //  final cartController = Get.find<CartController>(); 
      final cartController = Get.put(CartController());
    final controller = Get.find<ShopController>();
    final product = controller.getProductById(id);

    return Scaffold(
      appBar: AppBar(
        // title: Text(product.name),
        backgroundColor: Colors.grey.shade200,
        actions: [
          CustomIconButom(
            icons: Icons.share_outlined,
            onPressed: () {
              print('shaer');
            },
          )
        ],
        elevation: 0,
      ),
      body:  GetBuilder<CartController>(builder: (controller) {
    return  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // tag: 'product-${product.id}',
              width: double.infinity,
              height: 250,

              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                  image: DecorationImage(
                      image: AssetImage(
                        product.image,
                      ),
                      fit: BoxFit.contain)),
              //  child: Image.asset(

              //  )
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: product.name, boold: FontWeight.bold, size: 25),
                      CustomText(
                        text: product.description,
                        size: 15,
                      )
                    ],
                  )),
                  CustomIconButom(
                    icons: Icons.favorite_border,
                    size: 30,
                    onPressed: () {
                      print('Favorit');
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCounter(product
                  
                  ),
                  CustomText(
                    text:'\$${product.price}' ,
                    color: Colors.green,
                    boold: FontWeight.bold,
                    size: 24,
                  )
                ],
              ),
            ),
            _buildExpandableTile(
              title: "Product Detail",
              content:
                  "Apples Are Nutritious. Apples May Be Good For Weight Loss. Apples May Be Good For Your Heart. As Part Of A Healthful And Varied Diet.",
            ),
            _buildTileWithArrow(
              title: "Nutritions",
              trailingText: "100gr",
              onTap: () {},
            ),
            _buildTileWithArrow(
              title: "Review",
              trailingWidget: Row(
                children: List.generate(
                  5,
                  (index) =>
                      const Icon(Icons.star, color: Colors.orange, size: 18),
                ),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {},
                    child: CustomText(
                      text: "Add To Basket",
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      );
  },),
      
    );
  }
}

Widget _buildCounter( ProducatModel product) {
  final cartController = Get.find<CartController>();
  //  final cartController = Get.put(CartController());
  return GetBuilder<ShopController>(builder: (controller) {
    
    // final cartItem = cartController.cartItems.firstWhere(
    //   (item) => item.id == product.id,
    //   orElse: () => ProducatModel(
    //     id: product.id,
    //     name: product.name,
    //     description: product.description,
    //     price: product.price,
    //     image: product.image,
    //     quantity: 0,
    //   ),
    // );

    // final quantity = cartItem.quantity ?? 0;
    return  Row(
    children: [
       
          IconButton(
            icon: const Icon(Icons.remove),
            enableFeedback: true,
            color: Colors.green,
            autofocus: false,
            onPressed: ()=> controller.decrease(),
          ),
  
      Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100,width: 8,),
        //  borderRadius:,
    
      ),
      
       
           child: CustomText(text:controller.quantity.toString(),size: 20,backgroundColor:Colors.grey.shade100 ),
          ),
          CustomIconButom(icons: Icons.add, color: Colors.green,
           onPressed:()=>  controller.increase() )
        ],
      
       
   );
  },);
  
 
  
}

Widget _buildExpandableTile({required String title, required String content}) {
  return ExpansionTile(
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(content, style: const TextStyle(color: Colors.grey)),
      )
    ],
  );
}

Widget _buildTileWithArrow({
  required String title,
  String? trailingText,
  Widget? trailingWidget,
  required VoidCallback onTap,
}) {
  return ListTile(
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (trailingText != null)
          Text(trailingText, style: const TextStyle(color: Colors.grey)),
        if (trailingWidget != null) trailingWidget,
        const Icon(Icons.arrow_forward_ios, size: 16),
      ],
    ),
    onTap: onTap,
  );
}
