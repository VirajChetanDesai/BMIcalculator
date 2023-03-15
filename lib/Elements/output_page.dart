import 'package:calcbmi/Elements/BottomButton.dart';
import 'package:calcbmi/constants.dart';
import 'package:flutter/material.dart';
import 'Reusable_card.dart';
import 'input_page.dart';
import '../constants.dart';

class output_page extends StatefulWidget {
  double bmivar;
  late Color bmitextcolor;
  late String bmitext;
  late String bmiundertext;

  output_page(this.bmivar) {
    if (bmivar < 18.5) {
      bmitext = "UNDERWEIGHT";
      bmitextcolor = Colors.purpleAccent;
      bmiundertext =
          'BMI <18.5 is under the suggested weight according to BMI guidelines';
    } else if (bmivar >= 18.5 && bmivar < 25.0) {
      bmitext = "HEALTHY";
      bmitextcolor = Colors.green;
      bmiundertext =
          'BMI is between 18.5 and 25.0 the ideal weight for your height according to BMI rules';
    } else if (bmivar >= 25.0 && bmivar < 30.0) {
      bmitext = "OVERWEIGHT";
      bmitextcolor = Colors.orange;
      bmiundertext =
          'BMI is between 25.0 and 30.0 is slightly higer than healthy range as suggested by BMI guidelines';
    } else {
      bmitext = "OBESE";
      bmitextcolor = Colors.red;
      bmiundertext =
          'BMI >30.0 is alot higher the suggested healthy range according to BMI';
    }
  }
  @override
  State<output_page> createState() => _output_pageState();
}

class _output_pageState extends State<output_page> {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  _output_pageState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        crossFadeState = CrossFadeState.showSecond;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 20,left: 20,bottom: 5),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'RESULTS',
                style: kNumTextStyle,
              ),
            ),
            Expanded(
              child: ReusableCard(
                kActivecardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AnimatedCrossFade(
                        firstChild: Center(
                            child: Text(widget.bmitext,
                                style: kNumTextStyle.copyWith(
                                  color: widget.bmitextcolor,
                                  fontSize: 40,
                                ))),
                        secondChild: Column(
                          children: <Widget>[
                            Center(
                                child: Text(
                              widget.bmivar.toString(),
                              style: kNumTextStyle,
                            )),
                            Center(
                              child: Text(widget.bmitext,
                                  style: kTextStyle.copyWith(
                                    color: widget.bmitextcolor,
                                  )),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Center(
                                child: Text(
                                  widget.bmiundertext,
                                  style: kTextStyle.copyWith(
                                      fontFamily: 'SourceSansPro'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        crossFadeState: crossFadeState,
                        duration: const Duration(seconds: 1)),
                  ],
                ),
              ),
            ),
            BottomButton('RECALCULATE', () {
              Navigator.pop(context);
              }
            ),
          ],
        ),
      ),
    );
  }
}
