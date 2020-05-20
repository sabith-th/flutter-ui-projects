import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';

import 'widgets/curves.dart';
import 'widgets/header.dart';
import 'widgets/login_form.dart';

class Login extends StatefulWidget {
  final double screenHeight;

  const Login({Key key, this.screenHeight}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _headerTextAnimation;
  Animation<double> _formElementAnimation;
  Animation<double> _whiteTopClipperAnimation;
  Animation<double> _blueTopClipperAnimation;
  Animation<double> _greyTopClipperAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kLoginAnimationDuration,
    );

    final fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    _headerTextAnimation = fadeSlideTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.0,
          0.6,
          curve: Curves.easeOut,
        ),
      ),
    );
    _formElementAnimation = fadeSlideTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.7,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    final clipperOffsetTween =
        Tween<double>(begin: widget.screenHeight, end: 0.0);
    _blueTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.2,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _whiteTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.5,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _greyTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.35,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kWhite,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _whiteTopClipperAnimation,
            child: Container(
              color: kGrey,
            ),
            builder: (_, Widget child) {
              return ClipPath(
                clipper: WhiteTopClipper(
                  yOffset: _whiteTopClipperAnimation.value,
                ),
                child: Container(
                  color: kGrey,
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _greyTopClipperAnimation,
            child: Container(
              color: kBlue,
            ),
            builder: (_, Widget child) {
              return ClipPath(
                clipper: GreyTopClipper(
                  yOffset: _greyTopClipperAnimation.value,
                ),
                child: Container(
                  color: kBlue,
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _blueTopClipperAnimation,
            child: Container(
              color: kWhite,
            ),
            builder: (_, Widget child) {
              return ClipPath(
                clipper: BlueTopClipper(
                  yOffset: _blueTopClipperAnimation.value,
                ),
                child: child,
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: kPaddingL),
              child: Column(
                children: [
                  Header(
                    animation: _headerTextAnimation,
                  ),
                  Spacer(),
                  LoginForm(
                    animation: _formElementAnimation,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
