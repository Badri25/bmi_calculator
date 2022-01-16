import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   Gender selectedGender=Gender.male;
  int height = 180;
  int weight = 60;
  int age = 19;
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          Expanded(child: Row(
            children:<Widget> [
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender=Gender.male;
                  });
                },
                colour:selectedGender==Gender.male ? kActiveCardColor : kInactiveCardColor,
                cardChild: IconContent(icon:FontAwesomeIcons.mars ,label: 'MALE'),
              ),
              ),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender=Gender.female;
                  });
                },
                colour:selectedGender==Gender.female ? kActiveCardColor : kInactiveCardColor,
                cardChild:IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE') ,
              ),
              ),
            ],
          ),),
          Expanded(child:  ReusableCard(
            onPress: (){},
            colour:kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Text('HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children:<Widget> [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style:kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data:SliderTheme.of(context).copyWith(
                    inactiveTrackColor:  Color(0xFF8D8E98),
                    activeTickMarkColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0,
                    ),
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 25.0,
                    ),
                  ) ,
                  child: Slider(
                    value:height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue){
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
          Expanded(child: Row(
            children:<Widget> [
              Expanded(
                child: ReusableCard(
                  onPress: (){},
                  colour:kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [
                          RoundIconButton(
                            ic: FontAwesomeIcons.plus,
                            onP: (){
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            ic: FontAwesomeIcons.minus,
                            onP: (){
                              setState(() {
                                weight--;
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
                child:ReusableCard(colour:kActiveCardColor,
                  onPress: (){},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [
                          RoundIconButton(
                            ic: FontAwesomeIcons.plus,
                            onP: (){
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            ic: FontAwesomeIcons.minus,
                            onP: (){
                              setState(() {
                                age--;
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
          ),),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap:(){
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  ResultsPage(
                    bmi: calc.calcBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),

                  )));
            },
          ),
        ],
      ),

    );
  }
}