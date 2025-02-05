import 'package:flutter/material.dart';
import 'MyHomePage.dart';

// My application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.blueGrey,
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
            elevation: 4.0,
          ),
        ),
      ),
      title: 'Contact List',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
