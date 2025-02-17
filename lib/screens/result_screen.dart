import 'package:bmi_do/components/bottom_button.dart';
import 'package:bmi_do/components/custom_card.dart';
import 'package:bmi_do/utils/calculator.dart';
import 'package:bmi_do/values/text_styles.dart';
import 'package:bmi_do/values/values.dart';
import 'package:flutter/material.dart';

import '../values/strings.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.calculator});

  final Calculator calculator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppName),
      ),
      body: Padding(
        padding: kAppWidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 50,
          children: [
            Text(
              kBodyMassIndex,
              style: kResultScreenTitleTextStyle,
            ),
            CustomCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(kBmiResults, style: kResultScreenCardLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(calculator.getWholePart().toString(),
                          style: kResultScreenCardValueTextStyle),
                      Text(
                        '.${calculator.getFractionPart()}',
                        style: kResultScreenFractionValueTextStyle,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        Text(
                          calculator.getResultText(),
                          textAlign: TextAlign.center,
                          style: kResultTextStyle,
                        ),
                        SizedBox(height: 18.0),
                        Text(
                          calculator.getResultDescription(),
                          textAlign: TextAlign.center,
                          style: kResultDescriptionTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              label: kRecheck,
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
