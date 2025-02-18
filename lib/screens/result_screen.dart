import 'package:bmi_do/components/bottom_button.dart';
import 'package:bmi_do/components/custom_card.dart';
import 'package:bmi_do/utils/calculator.dart';
import 'package:bmi_do/values/text_styles.dart';
import 'package:bmi_do/values/values.dart';
import 'package:flutter/material.dart';

import '../values/strings.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.calculator});

  final Calculator calculator;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with TickerProviderStateMixin {
  late AnimationController wholePartController;
  late AnimationController fractionPartController;

  @override
  void initState() {
    super.initState();

    wholePartController = AnimationController(
      vsync: this,
      duration: Duration(seconds: animationDuration),
      upperBound: widget.calculator.getWholePart().toDouble(),
    );

    fractionPartController = AnimationController(
      vsync: this,
      duration: Duration(seconds: animationDuration),
      upperBound: widget.calculator.getFractionPart().toDouble(),
    );

    wholePartController.forward();
    fractionPartController.forward();

    wholePartController.addListener(() => setState(() {}));
    fractionPartController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    wholePartController.dispose();
    fractionPartController.dispose();
    super.dispose();
  }

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
                      Text('${wholePartController.value.toInt()}',
                          style: kResultScreenCardValueTextStyle),
                      Text(
                        '.${fractionPartController.value.toInt()}',
                        style: kResultScreenFractionValueTextStyle,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        Text(
                          widget.calculator.getResultText(),
                          textAlign: TextAlign.center,
                          style: kResultTextStyle,
                        ),
                        SizedBox(height: 18.0),
                        Text(
                          widget.calculator.getResultDescription(),
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
