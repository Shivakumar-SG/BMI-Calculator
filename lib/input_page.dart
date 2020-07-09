import 'package:flutter/material.dart';

const Color tileColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: tileColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: tileColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: tileColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: tileColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: tileColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: 300.0,
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour});

  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}
