import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutotial_app/model/fruit_shop.dart';
import 'package:tutotial_app/pages/shop_page.dart';

import '../components/bottom_nav.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateToTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = const [ShopPage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FruitShop>(
        create: (context) => FruitShop(),
        builder: (context, child) => Scaffold(
            bottomNavigationBar: BottomNav(
              onTabChange: (index) => navigateToTab(index),
            ),
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.pinkAccent,
              leading: const Icon(
                Icons.menu,
                size: 36,
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.person,
                    size: 36,
                  ),
                )
              ],
            ),
            backgroundColor: Colors.grey[300],
            body: pages[_selectedIndex]));
  }
}
