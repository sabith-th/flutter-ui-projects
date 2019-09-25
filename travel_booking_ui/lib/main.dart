import 'package:flutter/material.dart';
import 'package:travel_booking_ui/screens/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Booking UI',
      debugShowCheckedModeBanner: false,
      home: SearchScreen(),
    );
  }
}
