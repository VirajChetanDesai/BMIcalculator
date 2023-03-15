import 'package:flutter/material.dart';
import 'package:calcbmi/constants.dart';
class genderCd extends StatelessWidget {
  final String gender;
  final IconData icon;
  const genderCd(this.gender, this.icon,  {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(gender, style: kTextStyle)
      ],
    );
  }
}
