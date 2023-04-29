import 'package:flutter/material.dart';

class FormFieldData {
  final String id;
  final String? title;
  final String placeholder;
  final TextInputType keyboardType;
  final String? error;
  final String? mask;
  final int? maxLenght;
  final bool isSecureText;
  final TextStyle? titleStyle;
  final TextStyle? errorStyle;
  final InputDecoration? fieldDecoration;
  final int? minLenght;

  FormFieldData(
      {required this.id,
      required this.placeholder,
      this.title,
      this.keyboardType = TextInputType.none,
      this.error,
      this.mask,
      this.maxLenght,
      this.isSecureText = false,
      this.titleStyle,
      this.errorStyle,
      this.fieldDecoration,
      this.minLenght});
}
