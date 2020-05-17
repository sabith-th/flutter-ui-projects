import 'package:flutter/material.dart';
import 'package:onboarding_concept/screens/onboarding/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Concept Static',
      home: Onboarding(),
    );
  }
}
