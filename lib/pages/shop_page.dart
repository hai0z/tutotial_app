import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutotial_app/components/fruit_tile.dart';
import 'package:tutotial_app/model/fruit.dart';
import 'package:tutotial_app/model/fruit_shop.dart';
import 'package:tutotial_app/pages/fruit_detail.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Fruit fruit) {
    Provider.of<FruitShop>(context, listen: false).addToCart(fruit);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Added to cart'),
      backgroundColor: Colors.amber[700],
      duration: const Duration(milliseconds: 250),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FruitShop>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              "How would you like your fruit?",
              style: GoogleFonts.lato(fontSize: 24),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 3),
              itemCount: value.listFruit.length,
              itemBuilder: (context, index) {
                Fruit eachFruit = value.listFruit[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FruitDetail(fruit: eachFruit)));
                  },
                  child: FruitTile(
                    fruit: eachFruit,
                    onPressed: () {
                      addToCart(eachFruit);
                    },
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
