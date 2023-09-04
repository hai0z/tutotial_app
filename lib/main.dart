import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:tutotial_app/model/fruit.dart';
import 'package:tutotial_app/model/fruit_shop.dart';
import 'package:tutotial_app/pages/into_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FruitAdapter());
  await Hive.openBox<Fruit>('cart_box');

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FruitShop>(
      create: (context) => FruitShop(),
      builder: (context, child) => ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.deepPurple),
          home: const IntoPage(),
        ),
      ),
    );
  }
}
