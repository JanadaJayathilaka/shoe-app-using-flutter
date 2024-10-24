import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shpping_app/Home_Page.dart';
import 'package:shpping_app/cart_provider.dart';
import 'package:shpping_app/global_variables.dart';
import 'package:shpping_app/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CartProvider();
      },
      child: MaterialApp(
          title: 'Shopping App',
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(
                254,
                206,
                1,
                1,
              ),
              primary: Color.fromRGBO(
                254,
                206,
                1,
                1,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
            ),
            textTheme: TextTheme(
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
              bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            ),
            useMaterial3: true,
          ),
          home: HomePage()),
    );
  }
}
