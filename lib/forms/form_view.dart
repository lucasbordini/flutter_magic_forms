import 'package:flutter/material.dart';
import 'package:magic_forms/forms/form_controller.dart';
import 'package:magic_forms/forms/form_state.dart';

class FormView extends StatefulWidget {
  final FormController controller;
  final EdgeInsets? edgeInsets;
  final EdgeInsets? innerInsets;
  final InputDecoration? fieldDecoration;
  final InputDecoration? fieldErrorDecoration;

  const FormView({super.key, required this.controller, this.edgeInsets, this.innerInsets, this.fieldDecoration, this.fieldErrorDecoration});

  @override
  MagicFormState createState() => MagicFormState();
}
