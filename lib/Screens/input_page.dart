import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/reusable_card.dart';
import 'package:bmi_calculator/Components/column_icon.dart';
import '../constants.dart';
import 'result_page.dart';
import '../Components/bottom_button.dart';
import '../Components/round_icon_button.dart';
import 'package:bmi_calculator/calculating_brain.dart';

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

  int height = 180;
  int weight = 50;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // for male and female card
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    //refracted or reduced the code.

                    onPressed: () {
                      // using function as a object/property
                      setState(() {
                        selectedCard = ColorCardType.maleCard;
                      });
                    },
                    colour: selectedCard == ColorCardType.maleCard
                        ? ktileColor
                        : kinactiveColor,
                    cardChild:
                        ColumnIcon(icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedCard = ColorCardType.femaleCard;
                      });
                    },
                    colour: selectedCard == ColorCardType.femaleCard
                        ? ktileColor
                        : kinactiveColor,
                    cardChild: ColumnIcon(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          //for height
          Expanded(
            child: ReusableCard(
              colour: kinactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: klabelTxtStyle2,
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      //copies all the properties but gives value to none. creating our own widget
                      thumbColor: Colors.pinkAccent,
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      inactiveTrackColor: Colors.grey,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      min: 100.0,
                      max: 220.0,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                  Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                ],
              ),
            ),
          ),
          //for weight and age
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kinactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          weight.toString(),
                          style: klabelTxtStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kinactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          age.toString(),
                          style: klabelTxtStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age = age - 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age = age + 1;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //result page navigator
          BottomButton(
            onTap: () {
              calculatorBrain calc =
                  calculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiCalculation: calc.calculateBmi(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            bottomText: 'Find your BMI',
          ),
        ],
      ),
    );
  }
}
