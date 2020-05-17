import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final Widget image;
  final VoidCallback onPressed;

  const CustomButton(
      {Key key,
      this.color,
      this.textColor,
      this.text,
      this.image,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
      ),
      child: image != null
          ? OutlineButton(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: kPaddingL),
                    child: image,
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: textColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onPressed: onPressed,
            )
          : FlatButton(
              color: color,
              padding: EdgeInsets.all(kPaddingM),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
              onPressed: onPressed,
            ),
    );
  }
}
