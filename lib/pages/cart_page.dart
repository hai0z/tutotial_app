import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:tutotial_app/components/cart_tile.dart';
import 'package:tutotial_app/model/fruit.dart';
import 'package:tutotial_app/model/fruit_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void removeFromCart(Fruit fruit, int index) {
    _key.currentState!.removeItem(index, (context, animation) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: CartTile(fruit: fruit),
      );
    }, duration: const Duration(milliseconds: 500));

    Provider.of<FruitShop>(context, listen: false).deleteFromCart(fruit);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Remove success'),
      backgroundColor: Colors.deepPurple,
      duration: Duration(milliseconds: 250),
      elevation: 1,
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
                child: AnimatedList(
              key: _key,
              initialItemCount: value.cartList.length,
              padding: const EdgeInsets.symmetric(vertical: 16),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index, animation) {
                Fruit eachFruit = value.cartList[index];
                return CartTile(
                  fruit: eachFruit,
                  onPress: () {
                    removeFromCart(eachFruit, index);
                  },
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade300,
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
                              color: Colors.deepPurple.shade100),
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
                            border:
                                Border.all(color: Colors.primaries[1].shade100),
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
