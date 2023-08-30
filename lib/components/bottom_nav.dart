import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class BottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.deepPurple),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.grey[400],
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        gap: 8,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        tabBorderRadius: 30,
        iconSize: 24,
        duration: const Duration(milliseconds: 750),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Shop",
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: "Cart",
          )
        ],
      ),
    );
  }
}
