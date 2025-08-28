import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinegroceriesapp/Controller/Navigation-controller.dart';
import 'package:onlinegroceriesapp/Custom/CustomBottomItem.dart';
import 'package:onlinegroceriesapp/Custom/CustomText.dart';

class GroceryHomePage extends StatelessWidget {
  const GroceryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                expandedHeight: 140.0,
                backgroundColor: Colors.white,
                //  const Color.fromARGB(255, 141, 110, 110),
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      const  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Icon(Icons.location_on, color: Colors.red),
                            SizedBox(width: 4),
                            CustomText(
                                text: "Dhaka, Banassre",
                                boold: FontWeight.bold),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Store',
                            prefixIcon: Icon(Icons.search),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: controller.pages[controller.selectedIndex]),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            onTap: controller.changeTab,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: [
              customBottomItem(text: 'Shop', icon: Icons.store),
              customBottomItem(text: 'Explore', icon: Icons.manage_search_sharp),
              customBottomItem(text: 'Cart', icon: Icons.shopping_cart_outlined),
              customBottomItem(text: 'Favourite', icon: Icons.favorite_border),
              customBottomItem(text: 'Account', icon: Icons.person),
          
            ],
          ),
        );
      },
    );
  }
}
