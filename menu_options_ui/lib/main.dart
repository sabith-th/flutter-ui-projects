import 'package:flutter/material.dart';
import 'package:menu_options_ui/screens/menu_options_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Options UI',
      theme: ThemeData(primaryColor: Colors.black),
      home: MenuOptionsScreen(),
    );
  }
}
