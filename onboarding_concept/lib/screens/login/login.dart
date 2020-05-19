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

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kWhite,
      body: Stack(
        children: [
          ClipPath(
            clipper: WhiteTopClipper(),
            child: Container(
              color: kGrey,
            ),
          ),
          ClipPath(
            clipper: GreyTopClipper(),
            child: Container(
              color: kBlue,
            ),
          ),
          ClipPath(
            clipper: BlueTopClipper(),
            child: Container(
              color: kWhite,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: kPaddingL),
              child: Column(
                children: [
                  Header(),
                  Spacer(),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
