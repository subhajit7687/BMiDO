import 'package:bmi_do/components/bottom_button.dart';
import 'package:bmi_do/components/card_with_buttons.dart';
import 'package:bmi_do/components/custom_card.dart';
import 'package:bmi_do/screens/result_screen.dart';
import 'package:bmi_do/utils/calculator.dart';
import 'package:bmi_do/values/colors.dart';
import 'package:bmi_do/values/strings.dart';
import 'package:bmi_do/values/text_styles.dart';
import 'package:bmi_do/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

enum UpdateAction { increment, decrement }

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  int age = 22;
  int weight = 60;
  int height = 163;
  bool isFemale = false;

  void _updateAge(UpdateAction action) {
    setState(() {
      if (action == UpdateAction.increment) {
        age++;
      } else {
        if (age > 1) {
          age--;
        }
      }
    });
  }

  void _updateWeight(UpdateAction action) {
    setState(() {
      if (action == UpdateAction.increment) {
        weight++;
      } else {
        if (weight > 1) {
          weight--;
        }
      }
    });
  }

  void _updateHeight(double height) {
    setState(() {
      this.height = height.toInt();
    });
  }

  void _updateGender(bool isFemale) {
    setState(() {
      this.isFemale = isFemale;
    });
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
          spacing: kCardSpacing,
          children: [
            Expanded(
              child: Row(
                spacing: kCardSpacing,
                children: [
                  CustomCard(
                    child: CardWithButtons(
                      label: kAge,
                      value: age,
                      onIncrement: () {
                        _updateAge(UpdateAction.increment);
                      },
                      onDecrement: () {
                        _updateAge(UpdateAction.decrement);
                      },
                    ),
                  ),
                  CustomCard(
                    child: CardWithButtons(
                      label: kWeight,
                      value: weight,
                      onIncrement: () {
                        _updateWeight(UpdateAction.increment);
                      },
                      onDecrement: () {
                        _updateWeight(UpdateAction.decrement);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(kHeight, style: kCardLabelTextStyle),
                    Text(height.toString(), style: kCardBodyTextStyle),
                    Slider(
                      activeColor: kPrimaryColor,
                      value: height.toDouble(),
                      onChanged: _updateHeight,
                      min: 50,
                      max: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            kMinHeight,
                            style: kCardSmallTextStyle,
                          ),
                          Text(
                            kMaxHeight,
                            style: kCardSmallTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: CustomCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(kGender, style: kCardLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(kMale, style: kCardLabelTextStyle),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: FlutterSwitch(
                            value: isFemale,
                            onToggle: _updateGender,
                            height: 40,
                            width: 135,
                            activeColor: kScaffoldBackground,
                            inactiveColor: kScaffoldBackground,
                            toggleColor: kPrimaryColor,
                            toggleSize: 35,
                          ),
                        ),
                        Text(kFemale, style: kCardLabelTextStyle),
                      ],
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              label: kCalculateBmi,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      calculator: Calculator(weight: weight, height: height),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
