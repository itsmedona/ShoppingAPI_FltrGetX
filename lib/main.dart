import 'package:flutter/material.dart';
import 'package:shop_api_fltr_gtx/view/HomePage.dart';

void main() {
  runApp(ShopifyApp());
}

class ShopifyApp extends StatelessWidget {
  ShopifyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, 
    home: HomePage());
  }
}
