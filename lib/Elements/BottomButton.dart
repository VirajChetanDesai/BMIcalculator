import 'package:flutter/material.dart';
import 'input_page.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  late String entryText;
  VoidCallback func;
  BottomButton(this.entryText,this.func);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        color: kBottomColor,
        width: double.infinity,
        height: 80,
        child: Center(child: Text(entryText)),
      ),
    );
  }
}
