import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Home/SHOP/Shop.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0;
  void changeTab(int Tap) {
    selectedIndex = Tap;
    update();
  }

  final pages = [
    Shop(id: 1),
    Center(child: Text('Explore Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Cart  Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Favorite  Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Account  Page', style: TextStyle(fontSize: 24))),
  ];
}
