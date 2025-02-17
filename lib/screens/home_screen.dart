import 'package:bmi_do/components/bottom_button.dart';
import 'package:bmi_do/screens/calculate_screen.dart';
import 'package:bmi_do/values/strings.dart';
import 'package:bmi_do/values/text_styles.dart';
import 'package:bmi_do/values/theme_data.dart';
import 'package:bmi_do/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: getHomeScreenThemeData(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: kAppWidePadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  kAppName,
                  style: kHomeScreenLabelTextStyle,
                ),
                SvgPicture.asset('assets/background.svg'),
                Column(
                  children: [
                    Text(
                      kHomeScreenHeading,
                      style: kHomeScreenHeadingTextStyle,
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      kHomeScreenDetails,
                      style: kHomeScreenDetailsTextStyle,
                    ),
                  ],
                ),
                BottomButton(
                  label: kGetStarted,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalculateScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
