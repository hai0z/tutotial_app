import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              "How would you like your fruit?",
              style: GoogleFonts.openSans(fontSize: 20),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: ListView.builder(
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 10),
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
                        icon: const Icon(Icons.add),
                        onPressed: () => addToCart(eachFruit),
                      ),
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
