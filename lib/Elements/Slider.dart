import 'package:flutter/material.dart';
import '../constants.dart';

class CustomSlider extends StatefulWidget {
  Widget slider;
  CustomSlider(this.slider);
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbColor: kSliderThumbColor,
          activeTrackColor: Colors.white,
          inactiveTrackColor: kInactiveTrackColor,
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 15.0,
          ),
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 20.0,
          ),
          overlayColor: kOverlayColor,
        ),
        child: widget.slider,
      ),
    );
  }
}
