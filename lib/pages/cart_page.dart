import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tutotial_app/model/fruit.dart';
import 'package:tutotial_app/model/fruit_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Fruit fruit) {
    Provider.of<FruitShop>(context, listen: false).deleteFromCart(fruit);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Remove success'),
      backgroundColor: Colors.amber[700],
      duration: const Duration(milliseconds: 250),
      elevation: 3,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FruitShop>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              "Your Cart",
              style: GoogleFonts.openSans(fontSize: 20),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: value.cartList.length,
              itemBuilder: (context, index) {
                Fruit eachFruit = value.cartList[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  child: ListTile(
                    title: Text(
                      eachFruit.name,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    leading: Image.asset(eachFruit.imgPath),
                    subtitle: Text(
                      "\$${eachFruit.price}",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_shopping_cart),
                      onPressed: () => removeFromCart(eachFruit),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
