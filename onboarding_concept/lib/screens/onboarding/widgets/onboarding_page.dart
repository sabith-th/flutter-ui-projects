import 'package:flutter/material.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/cards_stack.dart';

class OnboardingPage extends StatelessWidget {
  final int pageNumber;
  final Widget lightCardChild;
  final Widget darkCardChild;
  final Widget textColumn;

  const OnboardingPage(
      {Key key,
      this.pageNumber,
      this.lightCardChild,
      this.darkCardChild,
      this.textColumn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardsStack(
          pageNumber: pageNumber,
          lightCardChild: lightCardChild,
          darkCardChild: darkCardChild,
        ),
        SizedBox(
          height: pageNumber % 2 == 1 ? 50.0 : 25.0,
        ),
        textColumn,
      ],
    );
  }
}
