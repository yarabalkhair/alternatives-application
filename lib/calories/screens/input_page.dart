import 'package:flutter_complete_guide/calories/calculator_BMI.dart';
import 'package:flutter_complete_guide/calories/components/icon_content.dart';
import 'package:flutter_complete_guide/calories/components/reusable_card.dart';
import 'package:flutter_complete_guide/calories/components/round_icon_button.dart';
import 'package:flutter_complete_guide/calories/constants.dart';
import 'package:flutter_complete_guide/calories/screens/bottom_button.dart';
import 'package:flutter_complete_guide/calories/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 170, weight = 70, age = 20, alevel=0;

  Map mapActivite = {
    0: "Low",
    1: "Moderate",
    2: "High"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: (selectedGender == Gender.male)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.male,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: (selectedGender == Gender.female)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.female,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        activeTrackColor: Colors.black87,
                        inactiveTrackColor: Color(0xff8d8e98),
                        thumbColor: Color(0xFFB7E4C7),
                        overlayColor: Color(0x29eb1555)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          '$weight',
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          '$age',
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Activity Lv.',
                          style: kLabelStyle,
                        ),
                        Text(
                          getcResult(alevel),
                          style: kNumberStyle,

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (alevel >0) alevel--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  if (alevel <2) alevel++;
                                });
                              },
                            ),

                          ],

                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),

          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorCal calc =
              CalculatorCal(selectedGender: selectedGender,height: height, weight: weight ,radioSelection:alevel,age:age);
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => ResultsPage(

                          calResult: calc.getcal(),
                        )),
              );
            },
          ),

        ],

      ),

    );

  }
  String getcResult(int alevel) {
    if (alevel == 0)
      return 'Low';
    else if (alevel == 1)
      return 'Mediam';
    else
      return 'High';
  }
}
