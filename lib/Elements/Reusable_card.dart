import 'package:flutter/material.dart';
class ReusableCard extends StatefulWidget {
  late final Color color;
  Widget? cardChild;
  VoidCallback? onPress;
  ReusableCard(this.color,[this.cardChild,this.onPress]);
  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: widget.cardChild,
      ),
    );;
  }
}