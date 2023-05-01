import 'package:flutter/material.dart';

class FormButtonData {
  /// The title of your button
  final String title;
  /// The height of your button
  final double height;
  /// The style of your button
  final ButtonStyle? style;
  /// The stule of the your button title
  final TextStyle? titleStyle;
  /// Top padding of your button
  final double? topPad;
  /// Icon to your button (indicates if the button will be a ElevatedButton or a ElevatedButton.icon)
  final IconData? icon;

  FormButtonData({
    required this.title,
    required this.height,
    this.style,
    this.titleStyle,
    this.icon,
    this.topPad,
  });
}
