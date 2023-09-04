import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutotial_app/model/fruit.dart';

class CartTile extends StatelessWidget {
  final Fruit fruit;
  final void Function()? onPress;

  const CartTile({super.key, required this.fruit, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: fruit.color[100],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListTile(
        title: Text(
          fruit.name,
          style: GoogleFonts.lato(fontWeight: FontWeight.w700),
        ),
        leading: Image.asset(fruit.imgPath),
        subtitle: Text(
          "\$${fruit.price}",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.remove_shopping_cart),
          onPressed: onPress,
        ),
      ),
    );
  }
}
