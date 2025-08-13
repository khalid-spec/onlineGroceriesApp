import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Model/Prodact_Model.dart';
import 'package:onlinegroceriesapp/theme/Image.dart';

class ShopController extends GetxController{
  List<ProducatModel> exclusiveOffers =[
    ProducatModel(name: 'Apple',
     image: Assets.Apple,
      price: '\$50', 
     description: '1kg, Priceg',
     ),
    ProducatModel(name: 'Spagty',
     image: Assets.Spagty,
      price: '\$50', 
     description: '12',
     ),
     
  ];
  List<ProducatModel> bestSelling  =[
    ProducatModel(name: 'CacaCola',
     image: Assets.Cacacola,
      price: '\$50', 
     description: '12',
     ),
    ProducatModel(name: 'Juice',
     image: Assets.Juice,
      price: '\$50', 
     description: '12',
     ),
  ];
  @override
  void update([List<Object>? ids, bool condition = true]) {
    // TODO: implement update
    super.update(ids, condition);
  }
    
}