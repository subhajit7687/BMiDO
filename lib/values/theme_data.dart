import 'package:bmi_do/values/colors.dart';
import 'package:bmi_do/values/text_styles.dart';
import 'package:flutter/material.dart';

// App
ThemeData getThemeData() => ThemeData().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kScaffoldBackground,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 27.0),
          backgroundColor: kPrimaryColor,
          textStyle: kFilledButtonTextStyle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(63.0),
          ),
        ),
      ),
      cardTheme: CardTheme().copyWith(
        color: kCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kScaffoldBackground,
        titleTextStyle: kAppBarTextStyle,
      ),
    );

// HomeScreen
ThemeData getHomeScreenThemeData() => ThemeData().copyWith(
      scaffoldBackgroundColor: kPrimaryColor,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 27.0),
          backgroundColor: kScaffoldBackground,
          foregroundColor: kFontColor,
          textStyle: kHomeScreenFilledButtonTextStyle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(63.0),
          ),
        ),
      ),
    );
