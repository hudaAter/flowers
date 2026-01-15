import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/bouquet_screen.dart';
import 'screens/extras_screen.dart';
import 'screens/color_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';

void main() {
  runApp(const FlowerShopApp());
}

class FlowerShopApp extends StatelessWidget {
  const FlowerShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'متجر الورود',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFA6C1), // AppColors.primary
        scaffoldBackgroundColor: const Color(
          0xFFFFFFFF,
        ), // AppColors.background
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFFFA6C1)),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomeScreen(),
        '/color_selection': (ctx) => const ColorScreen(),
        '/bouquet': (ctx) => const BouquetScreen(),
        '/extras': (ctx) => ExtrasScreen(),
        '/cart': (ctx) => const CartScreen(),
        '/checkout': (ctx) => const CheckoutScreen(
          totalPrice: 0.0,
        ), // Placeholder, will be overridden by arguments
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/checkout') {
          final args = settings.arguments as Map<String, dynamic>;
          final totalPrice = args['totalPrice'] as double;
          return MaterialPageRoute(
            builder: (context) => CheckoutScreen(totalPrice: totalPrice),
          );
        }
        return null;
      },
    );
  }
}
