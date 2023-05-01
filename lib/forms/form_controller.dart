import 'package:flutter/material.dart';
import 'package:magic_forms/data/form_button_data.dart';
import 'package:magic_forms/data/form_data.dart';

///This code defines a FormController class that is used to manage forms in a Flutter app. 
///It takes in onSubmit, a function that is called when the form is submitted, 
///a list of fields that represent the form fields, and a button that represents the submit button properties. 
///It also takes in an optional parameter, isAutoValidation, 
///which when set to true, enables automatic validation of the form.
class FormController {
  FormController(this.onSubmit, this.fields, this.button,
      {this.isAutoValidation = false}) {
    _generateControllers();
    if (isAutoValidation) {
      _generateAutoValidators();
    } else {
      _generateValidators();
    }
  }

  /// The list of fields that will be displayed on your form
  final List<FormFieldData> fields;

  /// The button properties that will be displayed as your submit button
  final FormButtonData button;

  /// A value to indicates if the form will or not be autovalidate (validate at every key press),
  /// If true, the submit button will only be enabled after all fields be filled
  /// If false, the submit button will do the entire form validation
  final bool isAutoValidation;

  ///Function called after the submit button is pressend IF the form is filled and valid
  ///This function will be called and send a Map<String, String> being theses value the {field_id: field.text}
  void Function(Map<String, String>) onSubmit;




  //Internal
  final controllers = <String, TextEditingController>{};
  final validators = <String, ValueNotifier<bool>>{};
  final autoValidators = <String, ValueNotifier<bool?>>{};
  final enabledButton = ValueNotifier(true);

  void _generateControllers() {
    controllers.addAll(
        {for (final field in fields) field.id: TextEditingController()});
  }

  void _generateValidators() {
    validators
        .addAll({for (final field in fields) field.id: ValueNotifier(true)});
  }

  void _generateAutoValidators() {
    enabledButton.value = false;
    autoValidators
        .addAll({for (final field in fields) field.id: ValueNotifier(null)});
    controllers.forEach((key, value) {
      value.addListener(() {
        if (value.text.isEmpty) {
          autoValidators[key]?.value = null;
        } else {
          final length =
              fields.firstWhere((element) => element.id == key).minLength ?? 0;
          autoValidators[key]?.value = value.text.length >= length;
        }
        _checkButtonStatusForForm();
      });
    });
  }

  void _checkButtonStatusForForm() {
    enabledButton.value =
        autoValidators.values.every((value) => value.value == true);
  }

  void validate() {
    final result = <String, String>{};
    controllers.forEach((key, value) => result.addAll({key: value.text}));
    if (isAutoValidation) {
      onSubmit(result);
    } else {
      var isValid = true;
      for (var field in fields) {
        final length = field.minLength ?? 0;
        if (result[field.id]?.length != length) {
          validators[field.id]?.value = false;
          isValid = false;
        } else {
          validators[field.id]?.value = true;
        }
      }
      if (isValid) {
        onSubmit(result);
      }
    }
  }
}
