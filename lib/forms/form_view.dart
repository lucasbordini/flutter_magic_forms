import 'package:flutter/material.dart';
import 'package:magic_forms/forms/form_controller.dart';
import 'package:magic_forms/forms/form_state.dart';

class FormView extends StatefulWidget {
  final FormController controller;
  final EdgeInsets? edgeInsets;

  const FormView({super.key, required this.controller, this.edgeInsets});

  @override
  MagicFormState createState() => MagicFormState();
}
