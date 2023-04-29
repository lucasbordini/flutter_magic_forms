import 'package:flutter/material.dart';
import 'package:magic_forms/data/form_button_data.dart';

class FormSubmitButton extends StatelessWidget {
  final FormButtonData data;
  final void Function() onTap;

  const FormSubmitButton({super.key, required this.onTap, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: data.height,
      child: ElevatedButton(
        onPressed: onTap,
        style: data.style ??
            ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(data.height),
                backgroundColor: Colors.blueAccent),
        child: Text(
          data.title,
          style: data.titleStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
