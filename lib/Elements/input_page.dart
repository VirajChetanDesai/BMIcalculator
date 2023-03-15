import 'package:calcbmi/Elements/BottomButton.dart';
import 'package:calcbmi/Elements/output_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Reusable_card.dart';
import 'Gender_Select_Card.dart';
import '../constants.dart';
import 'package:calcbmi/Elements/Slider.dart';
import 'output_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 19;
  var selectedGender;
  double bmiCalculate() {
    return double.parse(
        (weight.toDouble() / (height.toDouble() * height.toDouble() / 10000))
            .toStringAsFixed(1));
  }

  /*
  var maleCardcolor = inactivecardColor;
  var femaleCardColor = inactivecardColor;

  void updateColor(Gender gender){
    if(gender == Gender.Male){
      maleCardcolor = activecardColor;
      femaleCardColor = inactivecardColor;
    }else{
      maleCardcolor = inactivecardColor;
      femaleCardColor = activecardColor;
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    selectedGender == Gender.Male
                        ? kActivecardColor
                        : kInactivecardColor,
                    const genderCd('MALE', FontAwesomeIcons.mars),
                    () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      selectedGender == Gender.Female
                          ? kActivecardColor
                          : kInactivecardColor,
                      const genderCd('FEMALE', FontAwesomeIcons.venus), () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              kActivecardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Center(
                      child: Text(
                    'HEIGHT',
                    style: kTextStyle,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kTextStyle,
                      )
                    ],
                  ),
                  CustomSlider(
                    Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 240.0,
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    kActivecardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                weight++;
                              });
                            }),
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                weight--;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    kActivecardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                age++;
                              });
                            }),
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton('CALCULATE', () {
            if (selectedGender == Gender.Male ||
                selectedGender == Gender.Female) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return output_page(bmiCalculate());
              }));
            }
          })
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData child;
  VoidCallback function;
  RoundIconButton(this.child, this.function, {super.key});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: function,
      elevation: 10,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: kIconButtonColor,
      child: Icon(child),
    );
  }
}
