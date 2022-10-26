import 'package:flutter/material.dart';
import 'package:misterdiallo_portfolio/constants/constants.dart';
import 'package:misterdiallo_portfolio/data/data.dart';
import 'package:misterdiallo_portfolio/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: elevatedButtonThemeData),
      // ignore: prefer_const_constructors
      home: const HomeScreen(),
    );
  }
}
