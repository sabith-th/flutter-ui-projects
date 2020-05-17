import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';
import 'package:onboarding_concept/widgets/logo.dart';

class Header extends StatelessWidget {
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
          Text(
            'Welcome to Bubble',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: kBlack, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kSpaceS),
          Text(
            'Est ad dolor aute ex commodo tempor exercitation proident.',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: kBlack.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
