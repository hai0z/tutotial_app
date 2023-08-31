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
    var cartProvider = Provider.of<FruitShop>(context);
    var cart = cartProvider.cartList;
    double totalPrice = cart.fold(0, (previousValue, element) {
      return previousValue + element.price;
    });
    return Consumer<FruitShop>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: value.cartList.length,
              itemBuilder: (context, index) {
                Fruit eachFruit = value.cartList[index];
                return Container(
                  decoration: BoxDecoration(
                    color: eachFruit.color[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  child: ListTile(
                    title: Text(
                      eachFruit.name,
                      style: GoogleFonts.lato(fontWeight: FontWeight.w700),
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
            )),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 4),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[100]),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: const [
                            Text(
                              "Pay now",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
