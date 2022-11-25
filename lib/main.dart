import 'package:flutter/material.dart';
import 'package:mywalls/homescreen.dart';

Future<void> main() async {
  runApp(MaterialApp(
    theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white),
    home: const Main(),
  ));
}

String collectionName = "";

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
