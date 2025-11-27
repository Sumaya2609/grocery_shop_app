import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grocery_shop_app/model/cart_modal.dart';
import 'package:grocery_shop_app/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModal(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
      ),
    );
  }
}