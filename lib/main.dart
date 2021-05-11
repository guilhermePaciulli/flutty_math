import 'package:flutter/material.dart';
import 'Views/MainMenu.dart';

enum MathOperations { add, subtract }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainMenuView(),
    );
  }
}
