import 'package:flutter/material.dart';
import 'package:magic_forms/data/form_data.dart';

class FormFieldView extends StatelessWidget {
  final TextEditingController controller;
  final ValueNotifier<bool?> isValid;
  final FormFieldData data;

  const FormFieldView(
      {super.key,
      required this.controller,
      required this.data,
      required this.isValid});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          maxLength: data.maxLenght,
          inputFormatters: data.formatters ?? [],
          keyboardType: data.keyboardType,
          decoration: data.fieldDecoration ??
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
          ValueListenableBuilder<bool?>(
            valueListenable: isValid,
            builder: (context, value, child) => Visibility(
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
          ),
      ],
    );
  }
}
