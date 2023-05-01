import 'package:flutter/material.dart';
import 'package:magic_forms/data/form_button_data.dart';
import 'package:magic_forms/data/form_data.dart';

class FormController {
  final List<FormFieldData> fields;
  final FormButtonData button;
  final controllers = <String, TextEditingController>{};
  final validators = <String, ValueNotifier<bool>>{};
  final autoValidators = <String, ValueNotifier<bool?>>{};
  final bool isAutoValidation;

  final enabledButton = ValueNotifier(true);

  void Function(Map<String, String>) onSubmit;

  FormController(this.onSubmit, this.fields, this.button,
      {this.isAutoValidation = false}) {
    _generateControllers();
    if (isAutoValidation) {
      _generateAutoValidators();
    } else {
      _generateValidators();
    }
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

  void _generateAutoValidators() {
    enabledButton.value = false;
    controllers.forEach((key, value) {
      autoValidators.addAll({key: ValueNotifier(null)});
      value.addListener(() {
        if (value.text.isEmpty) {
          autoValidators[key]?.value = null;
        } else {
          autoValidators[key]?.value = value.text.isNotEmpty;
        }
        _checkButtonStatusForForm();
      });
    });
  }

  void _checkButtonStatusForForm() {
    var isValid = true;
    autoValidators.forEach((key, value) {
      if (value.value == null || value.value == false) {
        isValid = false;
      }
    });
    enabledButton.value = isValid;
  }

  void validate() {
    if (isAutoValidation) {
      final result = <String, String>{};
      controllers.forEach((key, value) => result.addAll({key: value.text}));
      onSubmit(result);
    } else {
      var isValid = true;
      controllers.forEach((key, value) {
        final lenght =
            fields.firstWhere((element) => element.id == key).minLenght ?? 0;
        if (value.text.isEmpty || value.text.length < lenght) {
          validators[key]?.value = false;
          isValid = false;
        } else {
          validators[key]?.value = true;
        }
      });
      if (isValid) {
        final result = <String, String>{};
        controllers.forEach((key, value) => result.addAll({key: value.text}));
        onSubmit(result);
      }
    }
  }
}
