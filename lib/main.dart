import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onlinegroceriesapp/Controller/Shop_controller.dart';
import 'package:onlinegroceriesapp/Splash.dart';

void main()async {
  await GetStorage.init();
  final controller = Get.put(ShopController());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
