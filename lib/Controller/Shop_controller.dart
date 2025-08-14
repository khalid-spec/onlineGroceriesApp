import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Model/Prodact_Model.dart';
import 'package:onlinegroceriesapp/theme/Image.dart';

class ShopController extends GetxController {
  List<ProducatModel> exclusiveOffers = [
    ProducatModel(
      id: 1,
      name: 'Apple',
      image: Assets.Apple,
      price: '\$5.99',
      description: '1kg, Priceg',
    ),
    ProducatModel(
      id: 2,
      name: 'Spagty',
      image: Assets.Spagty,
      price: '\$50',
      description: '12',
    ),
  ];
  List<ProducatModel> bestSelling = [
    ProducatModel(
      id: 3,
      name: 'CacaCola',
      image: Assets.Cacacola,
      price: '\$50',
      description: '12',
    ),
    ProducatModel(
      id: 4,
      name: 'Juice',
      image: Assets.Juice,
      price: '\$50',
      description: '12',
    ),
  ];

  ProducatModel getProductById(int id) {
    return [...exclusiveOffers, ...bestSelling]
        .firstWhere((item) => item.id == id);
  }
}
