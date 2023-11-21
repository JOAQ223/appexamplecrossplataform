import 'package:flutter/material.dart';

// Define a class to hold your styles
class AppStyles {
  static final ButtonStyle blueButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  );

  static final ButtonStyle orangeButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.orange,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  );

  static const EdgeInsets buttonPadding =
      EdgeInsets.symmetric(horizontal: 20, vertical: 10);

  static const EdgeInsets generalPadding =
      EdgeInsets.symmetric(horizontal: 20, vertical: 10);
}
