import 'package:flutter/material.dart';
import 'package:magic_forms/data/form_button_data.dart';
import 'package:magic_forms/data/form_data.dart';

class FormController {
  final List<FormFieldData> fields;
  final FormButtonData button;
  final controllers = <String, TextEditingController>{};
  final validators = <String, ValueNotifier<bool>>{};

  void Function() onSubmit;

  FormController(this.onSubmit, this.fields, this.button) {
    _generateControllers();
    _generateValidators();
  }

  void _generateControllers() {
    for (final field in fields) {
      controllers.addAll({field.id: TextEditingController()});
    }
  }

  void _generateValidators() {
    for (final field in fields) {
      validators.addAll({field.id: ValueNotifier(true)});
    }
  }

  void validate() {
    var isValid = false;
    controllers.forEach((key, value) {
      final lenght =
          fields.firstWhere((element) => element.id == key).minLenght ?? 0;
      if (value.text.isEmpty || value.text.length < lenght) {
        validators[key]?.value = false;
        isValid = false;
      }
    });
    if (isValid) {
      onSubmit();
    }
  }
}
