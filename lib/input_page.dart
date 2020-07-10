import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'column_icon.dart';

const Color tileColor = Color(0xFF1D1E33);
const Color inactiveColor = Color(0xFF111328);
const bottomContainerColor = Colors.pinkAccent;

enum ColorCardType {
  maleCard,
  femaleCard,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  ColorCardType selectedCard;

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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = ColorCardType.maleCard;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedCard == ColorCardType.maleCard
                            ? tileColor
                            : inactiveColor,
                        cardChild: ColumnIcon(
                            icon: FontAwesomeIcons.mars, label: 'MALE'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = ColorCardType.femaleCard;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedCard == ColorCardType.femaleCard
                            ? tileColor
                            : inactiveColor,
                        cardChild: ColumnIcon(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
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
                color: bottomContainerColor,
              ),
            ),
          ],
        ));
  }
}
