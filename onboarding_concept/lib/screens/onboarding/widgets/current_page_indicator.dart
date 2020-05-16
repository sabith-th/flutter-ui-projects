import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';

class _OnboardingPageIndicatorPainter extends CustomPainter {
  final Color color;
  final double startAngle;
  final double indicatorLength;

  _OnboardingPageIndicatorPainter({
    this.color,
    this.startAngle,
    this.indicatorLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: (size.shortestSide + 12.0) / 2),
      startAngle,
      indicatorLength,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_OnboardingPageIndicatorPainter oldDelegate) {
    return this.color != oldDelegate.color ||
        this.startAngle != oldDelegate.startAngle;
  }
}

class OnboardingPageIndicator extends StatelessWidget {
  final int currentPage;
  final Widget child;

  const OnboardingPageIndicator({Key key, this.currentPage, this.child})
      : super(key: key);

  Color _getPageIndicatorColor(int pageIndex) {
    return currentPage > pageIndex ? kWhite : kWhite.withOpacity(0.25);
  }

  double get indicatorGap => pi / 2;
  double get indicatorLength => pi / 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: _OnboardingPageIndicatorPainter(
          color: _getPageIndicatorColor(0),
          startAngle: (4 * indicatorLength) - (indicatorLength + indicatorGap),
          indicatorLength: indicatorLength,
        ),
        child: CustomPaint(
          painter: _OnboardingPageIndicatorPainter(
            color: _getPageIndicatorColor(2),
            startAngle:
                (4 * indicatorLength) + (indicatorLength + indicatorGap),
            indicatorLength: indicatorLength,
          ),
          child: child,
        ),
      ),
    );
  }
}
