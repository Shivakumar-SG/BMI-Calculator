import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPressed});

  final Color colour;
  final Widget cardChild;
  final Function onPressed; // function is created

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // on tapping, the function is initialised.
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
