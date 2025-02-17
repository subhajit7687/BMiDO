import 'package:bmi_do/components/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../values/text_styles.dart';

class CardWithButtons extends StatelessWidget {
  const CardWithButtons({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  final String label;
  final int value;
  final void Function() onIncrement;
  final void Function() onDecrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kCardLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kCardBodyTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundedIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onDecrement,
            ),
            RoundedIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onIncrement,
            ),
          ],
        ),
      ],
    );
  }
}
