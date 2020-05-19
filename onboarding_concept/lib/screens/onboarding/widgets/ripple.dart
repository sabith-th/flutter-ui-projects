import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';

class Ripple extends StatelessWidget {
  final double radius;

  const Ripple({Key key, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      left: screenWidth / 2 - radius,
      bottom: 2 * kPaddingL - radius,
      child: Container(
        width: 2 * radius,
        height: 2 * radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kWhite,
        ),
      ),
    );
  }
}
