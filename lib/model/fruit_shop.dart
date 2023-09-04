import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tutotial_app/model/fruit.dart';

class FruitShop with ChangeNotifier {
  final List<Fruit> _shop = [
    Fruit(
        name: "Apple",
        price: 2.55,
        imgPath: "lib/images/apple.png",
        color: Colors.red,
        type: "fruit"),
    Fruit(
        name: "Corn",
        price: 1.55,
        imgPath: 'lib/images/corn.png',
        color: Colors.yellow,
        type: "fruit"),
    Fruit(
        name: "Cucumber",
        price: 1.25,
        imgPath: 'lib/images/cucumber.png',
        color: Colors.green,
        type: "fruit"),
    Fruit(
        name: "Grapes",
        price: 5.25,
        imgPath: 'lib/images/grapes.png',
        color: Colors.deepPurple,
        type: "fruit"),
    Fruit(
        name: "Banana",
        price: 4.75,
        imgPath: 'lib/images/bananas.png',
        color: Colors.yellow,
        type: "fruit"),
    Fruit(
        name: "Passion fruit",
        price: 2.25,
        imgPath: 'lib/images/passion-fruit.png',
        color: Colors.teal,
        type: "fruit"),
    Fruit(
        name: "Dragon fruit",
        price: 3.35,
        imgPath: 'lib/images/dragon-fruit.png',
        color: Colors.pink,
        type: "fruit"),
    Fruit(
        name: "Mango",
        price: 3.50,
        imgPath: 'lib/images/mango.png',
        color: Colors.orange,
        type: "fruit"),
    Fruit(
        name: "Pineapple",
        price: 4.55,
        imgPath: 'lib/images/pineapple.png',
        color: Colors.amber,
        type: "fruit"),
    Fruit(
        name: "Pomegranate",
        price: 3.47,
        imgPath: 'lib/images/pomegranate.png',
        color: Colors.red,
        type: "fruit"),
    Fruit(
        name: "Strawberry",
        price: 8.50,
        imgPath: 'lib/images/strawberry.png',
        color: Colors.pink,
        type: "fruit"),
    Fruit(
        name: "Avocado",
        price: 5.50,
        imgPath: 'lib/images/avocado.png',
        color: Colors.green,
        type: "vegetable"),
    Fruit(
        name: "Broccoli",
        price: 5.50,
        imgPath: 'lib/images/broccoli.png',
        color: Colors.lightGreen,
        type: "vegetable"),
    Fruit(
        name: "Cabbage",
        price: 5.50,
        imgPath: 'lib/images/cabbage.png',
        color: Colors.green,
        type: "vegetable"),
    Fruit(
        name: "Pepper",
        price: 5.50,
        imgPath: 'lib/images/chili-pepper.png',
        color: Colors.red,
        type: "vegetable"),
    Fruit(
        name: "Pea",
        price: 5.50,
        imgPath: 'lib/images/pea.png',
        color: Colors.green,
        type: "vegetable"),
    Fruit(
        name: "Pumpkin",
        price: 5.50,
        imgPath: 'lib/images/pumpkin.png',
        color: Colors.orange,
        type: "vegetable"),
    Fruit(
        name: "Spinach",
        price: 5.50,
        imgPath: 'lib/images/spinach.png',
        color: Colors.green,
        type: "vegetable"),
    Fruit(
        name: "Peach",
        price: 5.50,
        imgPath: 'lib/images/peach.png',
        color: Colors.deepOrange,
        type: "fruit"),
    Fruit(
        name: "Burger",
        price: 5.50,
        imgPath: 'lib/images/burger.png',
        color: Colors.orange,
        type: "food"),
    Fruit(
        name: "Fried rice",
        price: 5.50,
        imgPath: 'lib/images/fried-rice.png',
        color: Colors.deepOrange,
        type: "food"),
    Fruit(
        name: "Noodle",
        price: 5.50,
        imgPath: 'lib/images/noodles.png',
        color: Colors.yellow,
        type: "food"),
    Fruit(
        name: "Chicken leg",
        price: 5.50,
        imgPath: 'lib/images/chicken-leg.png',
        color: Colors.brown,
        type: "food"),
  ];

  final List<Fruit> _cart = [];

  void addToCart(Fruit fruit) async {
    _cart.add(fruit);
    notifyListeners();
  }

  void deleteFromCart(Fruit fruit) async {
    _cart.remove(fruit);

    notifyListeners();
  }

  List<Fruit> get listFruit => _shop;

  List<Fruit> get cartList => _cart;
}
