import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';
import 'package:onboarding_concept/widgets/logo.dart';

import 'fade_slide_transition.dart';

class Header extends StatelessWidget {
  final Animation<double> animation;

  const Header({Key key, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Logo(
            color: kBlue,
            size: 48.0,
          ),
          SizedBox(height: kSpaceM),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: Text(
              'Welcome to Bubble',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: kBlack, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: kSpaceS),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: Text(
              'Est ad dolor aute ex commodo tempor exercitation proident.',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: kBlack.withOpacity(0.5)),
            ),
          ),
        ],
      ),
    );
  }
}
