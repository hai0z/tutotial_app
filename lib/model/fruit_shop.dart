import 'package:flutter/material.dart';
import 'package:tutotial_app/model/fruit.dart';

class FruitShop extends ChangeNotifier {
  final List<Fruit> _shop = [
    Fruit(name: "Apple", price: 2.50, imgPath: "lib/images/apple.png"),
    Fruit(name: "Corn", price: 1.50, imgPath: 'lib/images/corn.png'),
    Fruit(name: "Cucumber", price: 1.25, imgPath: 'lib/images/cucumber.png'),
    Fruit(name: "Grapes", price: 5.00, imgPath: 'lib/images/grapes.png'),
    Fruit(
        name: "Passion fruit",
        price: 2.25,
        imgPath: 'lib/images/passion-fruit.png'),
    Fruit(
        name: "Dragon fruit",
        price: 3.00,
        imgPath: 'lib/images/dragon-fruit.png'),
    Fruit(name: "Mango", price: 3.50, imgPath: 'lib/images/mango.png'),
    Fruit(name: "Pineapple", price: 4.50, imgPath: 'lib/images/pineapple.png'),
    Fruit(
        name: "Pomegranate",
        price: 3.47,
        imgPath: 'lib/images/pomegranate.png'),
    Fruit(
        name: "Strawberry", price: 8.50, imgPath: 'lib/images/strawberry.png'),
    Fruit(name: "Peach", price: 5.50, imgPath: 'lib/images/peach.png'),
  ];

  final List<Fruit> _cart = [];

  void addToCart(Fruit fruit) {
    _cart.add(fruit);
    notifyListeners();
  }

  void deleteFromCart(Fruit fruit) {
    _cart.remove(fruit);
    notifyListeners();
  }

  List<Fruit> get listFruit => _shop;

  List<Fruit> get cartList => _cart;
}
