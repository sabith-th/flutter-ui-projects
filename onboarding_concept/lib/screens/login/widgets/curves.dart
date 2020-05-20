import 'package:flutter/material.dart';

class BlueTopClipper extends CustomClipper<Path> {
  final double yOffset;

  BlueTopClipper({this.yOffset});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, 220.0 + yOffset)
      ..quadraticBezierTo(
        size.width / 2.2,
        260.0 + yOffset,
        size.width,
        170.0 + yOffset,
      )
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class GreyTopClipper extends CustomClipper<Path> {
  final double yOffset;

  GreyTopClipper({this.yOffset});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, 265.0 + yOffset)
      ..quadraticBezierTo(
        size.width / 2,
        285.0 + yOffset,
        size.width,
        185.0 + yOffset,
      )
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WhiteTopClipper extends CustomClipper<Path> {
  final double yOffset;

  WhiteTopClipper({this.yOffset});

  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 310.0 + yOffset)
      ..quadraticBezierTo(
          size.width / 2, 310.0 + yOffset, size.width, 200.0 + yOffset)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
