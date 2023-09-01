import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tutotial_app/model/fruit.dart';

class FruitTile extends StatelessWidget {
  final Fruit fruit;
  final void Function()? onPressed;
  const FruitTile({super.key, required this.fruit, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: fruit.color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: fruit.color[200],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  width: 60,
                  height: 40,
                  child: Text(
                    "\$${fruit.price}",
                    style: GoogleFonts.lato(
                        color: fruit.color[800],
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Hero(
              tag: fruit.name,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                child: Image.asset(
                  fruit.imgPath,
                ),
              ),
            ),
            Text(
              fruit.name,
              style:
                  GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: onPressed,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
