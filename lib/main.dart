import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color.fromARGB(0xFF, 15, 16, 29),
        scaffoldBackgroundColor: Color.fromARGB(0xFF, 15, 16, 29),
      ),
      home: InputPage(),
    );
  }
}
