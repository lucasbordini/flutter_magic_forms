import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldData {
  ///The id of the field, use this to get the value on submit
  final String id;
  ///A title for the field (if you want to have one)
  ///This title will be displayed above the field
  final String? title;
  /// Placeholder for your field
  final String placeholder;
  /// They keyboard type of your field i.e. TextInputType.number
  final TextInputType keyboardType;
  /// The string will appear bellow the field if it's has an error (not filled or not reached the min lenght)
  final String? error;
  /// Formatters for your field
  final List<TextInputFormatter>? formatters;
  /// MaxLength of your field
  final int? maxLength;
  /// Indicates if the text ne to be obscured
  final bool isSecureText;
  /// The style of your title (aka: TextStyle)
  final TextStyle? titleStyle;
  /// The style of your error label (aka: TextStyle)
  final TextStyle? errorStyle;
  /// MinLength of your field (used for validation)
  final int? minLength;

  FormFieldData({
    required this.id,
    required this.placeholder,
    this.title,
    this.keyboardType = TextInputType.text,
    this.error,
    this.formatters,
    this.maxLength,
    this.isSecureText = false,
    this.titleStyle,
    this.errorStyle,
    this.minLength,
  });
}
