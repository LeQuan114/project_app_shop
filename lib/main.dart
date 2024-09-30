// ignore_for_file: prefer_const_constructors

import 'package:final_project/pages/add_category.dart';
import 'package:final_project/pages/add_product.dart';
import 'package:final_project/pages/cart_page.dart';
import 'package:final_project/pages/home_page.dart';
import 'package:final_project/pages/item_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/": (context) => const HomePage(),
        "cartPage": (context) => const CartPage(),
        "itemPage": (context) => ItemPage(),
        "addProduct": (context) => AddProductScreen(),
        "addCategory": (context) => AddCategory(),// Add the new route for AddProductScreen

      },
    );
  }
}
