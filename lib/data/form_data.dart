import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldData {
  final String id;
  final String? title;
  final String placeholder;
  final TextInputType keyboardType;
  final String? error;
  final List<TextInputFormatter>? formatters;
  final int? maxLenght;
  final bool isSecureText;
  final TextStyle? titleStyle;
  final TextStyle? errorStyle;
  final int? minLenght;

  FormFieldData(
      {required this.id,
      required this.placeholder,
      this.title,
      this.keyboardType = TextInputType.text,
      this.error,
      this.formatters,
      this.maxLenght,
      this.isSecureText = false,
      this.titleStyle,
      this.errorStyle,
      this.minLenght});
}
