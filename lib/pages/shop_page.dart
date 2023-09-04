import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tutotial_app/components/fruit_tile.dart';
import 'package:tutotial_app/model/fruit.dart';
import 'package:tutotial_app/model/fruit_shop.dart';
import 'package:tutotial_app/pages/fruit_detail.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Fruit fruit) {
    Provider.of<FruitShop>(context, listen: false).addToCart(fruit);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Added to cart'),
      backgroundColor: Colors.deepPurple,
      duration: Duration(milliseconds: 250),
    ));
  }

  @override
  Widget build(BuildContext context) {
    List<Fruit> fruits = Provider.of<FruitShop>(context)
        .listFruit
        .where((element) => element.type == "fruit")
        .toList();

    List<Fruit> vegetable = Provider.of<FruitShop>(context)
        .listFruit
        .where((element) => element.type == "vegetable")
        .toList();

    List<Fruit> food = Provider.of<FruitShop>(context)
        .listFruit
        .where((element) => element.type == "food")
        .toList();

    return Consumer<FruitShop>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.only(left: 12),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              "How would you like your fruit?",
              style: GoogleFonts.lato(fontSize: 24.sp),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              height: 250.w,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                cacheExtent: 10,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: fruits.length,
                itemBuilder: (context, index) {
                  Fruit eachFruit = fruits[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FruitDetail(fruit: eachFruit),
                      ));
                    },
                    child: FruitTile(
                      fruit: eachFruit,
                      onPressed: () {
                        addToCart(eachFruit);
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Vegetables",
              style: GoogleFonts.lato(fontSize: 24.sp),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              height: 250.w,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                cacheExtent: 10,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: vegetable.length,
                itemBuilder: (context, index) {
                  Fruit eachFruit = vegetable[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FruitDetail(fruit: eachFruit),
                      ));
                    },
                    child: FruitTile(
                      fruit: eachFruit,
                      onPressed: () {
                        addToCart(eachFruit);
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Foods",
              style: GoogleFonts.lato(fontSize: 24.sp),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              height: 250.w,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                cacheExtent: 10,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: food.length,
                itemBuilder: (context, index) {
                  Fruit eachFruit = food[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FruitDetail(fruit: eachFruit),
                      ));
                    },
                    child: FruitTile(
                      fruit: eachFruit,
                      onPressed: () {
                        addToCart(eachFruit);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
