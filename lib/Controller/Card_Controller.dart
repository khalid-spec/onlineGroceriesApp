import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Model/Prodact_Model.dart';

class CartController extends GetxController {
  var cartItems = <ProducatModel>[].obs;

  void addToCart(ProducatModel product) {
    // لو المنتج موجود نزيد الكمية
    int index = cartItems.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      cartItems[index].quantity!+1;
    } else {
      cartItems.add(product);
    }
    update();
  }

  void removeFromCart(ProducatModel product) {
    cartItems.removeWhere((item) => item.id == product.id);
    update();
  }

  void increase(ProducatModel product) {
    int index = cartItems.indexWhere((item) => item.id == product.id);
    if (index >=0) {
      cartItems[index].quantity = cartItems[index].quantity! + 1;
      update();
    }
  }

  void decrease(ProducatModel product) {
    int index = cartItems.indexWhere((item) => item.id == product.id);
    if (index >= 0 && cartItems[index].quantity! > 1) {
     cartItems[index].quantity = cartItems[index].quantity! - 1;
    }
    update();
  }

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity!));
}
