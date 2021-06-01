import 'package:flutter/material.dart';
import 'Views/MainMenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xfffcbf49),
      ),
      home: MainMenuView(),
    );
  }
}
