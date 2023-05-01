import 'package:flutter/material.dart';
import 'package:magic_forms/data/form_button_data.dart';

class FormSubmitButton extends StatelessWidget {
  final FormButtonData data;
  final void Function() onTap;
  final ValueNotifier<bool> isValid;

  const FormSubmitButton(
      {super.key,
      required this.onTap,
      required this.data,
      required this.isValid});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: data.height,
      child: ValueListenableBuilder<bool>(
        valueListenable: isValid,
        builder: (context, valid, child) => data.icon != null
            ? ElevatedButton.icon(
                onPressed: valid ? onTap : null,
                icon: Icon(data.icon, color: data.titleStyle?.color ?? Colors.white,),
                label: Text(
                  data.title,
                  style: data.titleStyle ??
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                style: data.style ??
                    ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(data.height),
                        backgroundColor: Colors.blueAccent),
              )
            : ElevatedButton(
                onPressed: valid ? onTap : null,
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
      ),
    );
  }
}
