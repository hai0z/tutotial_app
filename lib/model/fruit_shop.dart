import 'package:flutter/material.dart';
import 'package:tutotial_app/model/fruit.dart';

class FruitShop with ChangeNotifier {
  final List<Fruit> _shop = [
    Fruit(
        name: "Apple",
        price: 2.55,
        imgPath: "lib/images/apple.png",
        color: Colors.red),
    Fruit(
        name: "Corn",
        price: 1.55,
        imgPath: 'lib/images/corn.png',
        color: Colors.yellow),
    Fruit(
        name: "Cucumber",
        price: 1.25,
        imgPath: 'lib/images/cucumber.png',
        color: Colors.green),
    Fruit(
        name: "Grapes",
        price: 5.25,
        imgPath: 'lib/images/grapes.png',
        color: Colors.deepPurple),
    Fruit(
        name: "Banana",
        price: 4.75,
        imgPath: 'lib/images/bananas.png',
        color: Colors.yellow),
    Fruit(
        name: "Passion fruit",
        price: 2.25,
        imgPath: 'lib/images/passion-fruit.png',
        color: Colors.teal),
    Fruit(
        name: "Dragon fruit",
        price: 3.35,
        imgPath: 'lib/images/dragon-fruit.png',
        color: Colors.pink),
    Fruit(
        name: "Mango",
        price: 3.50,
        imgPath: 'lib/images/mango.png',
        color: Colors.orange),
    Fruit(
        name: "Pineapple",
        price: 4.55,
        imgPath: 'lib/images/pineapple.png',
        color: Colors.amber),
    Fruit(
        name: "Pomegranate",
        price: 3.47,
        imgPath: 'lib/images/pomegranate.png',
        color: Colors.red),
    Fruit(
        name: "Strawberry",
        price: 8.50,
        imgPath: 'lib/images/strawberry.png',
        color: Colors.pink),
    Fruit(
        name: "Peach",
        price: 5.50,
        imgPath: 'lib/images/peach.png',
        color: Colors.deepOrange),
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
