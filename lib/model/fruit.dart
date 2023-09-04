import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'fruit.g.dart';

@HiveType(typeId: 0)
class Fruit extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  double price;

  @HiveField(2)
  String imgPath;

  @HiveField(3)
  final color;

  @HiveField(4)
  String type;

  Fruit(
      {required this.name,
      required this.price,
      required this.imgPath,
      required this.color,
      required this.type});
}
