import 'package:flutter/material.dart';
import 'package:login_page_ui/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page UI',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
