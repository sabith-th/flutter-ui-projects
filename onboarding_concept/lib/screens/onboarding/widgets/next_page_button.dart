import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.all(kPaddingM),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: kWhite,
      child: Icon(
        Icons.arrow_forward,
        color: kBlue,
        size: 32.0,
      ),
      onPressed: onPressed,
    );
  }
}
