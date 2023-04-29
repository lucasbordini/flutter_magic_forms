import 'package:flutter/material.dart';
import 'package:magic_forms/forms/form_controller.dart';

class FormView extends StatefulWidget {
  final FormController controller;
  final EdgeInsets? edgeInsets;

  const FormView({super.key, required this.controller, this.edgeInsets});

  @override
  FormState createState() => FormState();
}
