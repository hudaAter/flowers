import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/bouquet_screen.dart';
import 'screens/extras_screen.dart';

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
        scaffoldBackgroundColor: const Color(0xFFFFFFFF), // AppColors.background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFA6C1),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomeScreen(),
        '/bouquet': (ctx) => const BouquetScreen(),
        '/extras': (ctx) =>  ExtrasScreen(),
      },
    );
  }
}
