import 'package:flutter/material.dart';
import 'package:magic_forms/data/form_data.dart';

class MagicFormFieldView extends StatelessWidget {
  final TextEditingController controller;
  final ValueNotifier<bool?> isValid;
  final InputDecoration? fieldDecoration;
  final InputDecoration? fieldErrorDecoration;
  final FormFieldData data;

  const MagicFormFieldView(
      {super.key,
      required this.controller,
      required this.data,
      required this.isValid,
      this.fieldDecoration,
      this.fieldErrorDecoration});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool?>(
      valueListenable: isValid,
      builder: (context, value, child) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (data.title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                data.title!,
                style: data.titleStyle ??
                    const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          TextFormField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            maxLength: data.maxLength,
            inputFormatters: data.formatters ?? [],
            keyboardType: data.keyboardType,
            obscureText: data.isSecureText,
            decoration: value == false
                ? fieldErrorDecoration?.copyWith(hintText: data.placeholder) ??
                    InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 8),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: data.placeholder,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    )
                : fieldDecoration?.copyWith(hintText: data.placeholder) ??
                    InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 8),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: data.placeholder,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
          ),
          if (data.error != null)
            Visibility(
              visible: value == false,
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  data.error!,
                  style: data.errorStyle ??
                      const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
