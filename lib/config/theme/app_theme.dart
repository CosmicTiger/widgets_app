import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

/// AppTheme class
/// All type of customizations can be done here
/// Without overdo the MaterialApp instance class.
class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greather than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],

      /// appBarTheme allows to customize all the possible different App Bars that could be render within the application
      /// in the different cases regarding platforms.
      appBarTheme: AppBarTheme(
        centerTitle: false,
      ));
}
