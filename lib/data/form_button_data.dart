import 'package:flutter/material.dart';

class FormButtonData {
  final String title;
  final double height;
  final ButtonStyle? style;
  final TextStyle? titleStyle;
  final double? topPad;
  final IconData? icon;

  FormButtonData(
    {
    required this.title,
    required this.height,
    this.style,
    this.titleStyle,
    this.icon,
    this.topPad,
  });
}
