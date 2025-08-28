import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Model/Prodact_Model.dart';
import 'package:onlinegroceriesapp/theme/Image.dart';

class ShopController extends GetxController {
  var quantity=1;
  List<ProducatModel>product=[];

@override
void onInit() {
   
    super.onInit();
    loadProducts();

  }
    
 Future<void> loadProducts() async {
    final  response = await rootBundle.loadString('asset/data/product.json');
    final data = json.decode(response) as List;
print(response);
    product = data.map((e) => ProducatModel.fromJson(e)).toList();
print('11111111111111111111111111111');
print(data);
  print("📦 Loaded Products: ${product.length}");

    


    update();
  }
   List<ProducatModel> getExclusive( ) =>
      product.where((p) => p.category.contains("exclusive") ).toList();
      

  List<ProducatModel> getBestSelling() =>
      // ignore: unrelated_type_equality_checks
      product.where((p) => p.category.contains("bestSelling")).toList();

  List<ProducatModel> getGroceries() =>
      product.where((p) => p.category.contains("groceries")).toList();
  

  void increase(){
    quantity++;
    update();
  }
  void decrease(){
    if(quantity>1){
      quantity--;
      update();
    }
  }

 
}
