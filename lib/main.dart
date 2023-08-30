import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutotial_app/components/bottom_nav.dart';
import 'package:tutotial_app/model/fruit_shop.dart';
import 'package:tutotial_app/pages/cart_page.dart';
import 'package:tutotial_app/pages/shop_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  void navigateToTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = const [ShopPage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FruitShop(),
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              bottomNavigationBar: BottomNav(
                onTabChange: (index) => navigateToTab(index),
              ),
              appBar: AppBar(title: const Text('Fruit Shop')),
              backgroundColor: Colors.grey[300],
              body: pages[_selectedIndex])),
    );
  }
}
