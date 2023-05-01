import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_forms/magic_forms.dart';
import 'package:magic_forms_example/utils/date_input_formatt.dart';

class CustomSubmitFormScreen extends StatefulWidget {
  const CustomSubmitFormScreen({super.key});

  @override
  _CustomSubmitFormScreenState createState() => _CustomSubmitFormScreenState();
}

class _CustomSubmitFormScreenState extends State<CustomSubmitFormScreen> {
  final nameID = "name_id";
  final lastNameID = "last_name_id";
  final phoneID = "phone_id";
  final emailID = "email_id";
  final passID = "pass_id";
  final zipID = "zip_id";
  final dateID = "date_id";

  List<FormFieldData> get fields => [
        FormFieldData(
            id: nameID, placeholder: "Insert your name", title: "Name"),
        FormFieldData(
            id: lastNameID,
            placeholder: "Last Name",
            title: "Last Name",
            titleStyle: const TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w900)),
        FormFieldData(
            id: phoneID,
            placeholder: "Phone number",
            keyboardType: TextInputType.phone),
        FormFieldData(
            id: emailID,
            placeholder: "E-Mail",
            error: "You must provide an E-mail",
            errorStyle: const TextStyle(
                color: Colors.yellow,
                fontSize: 10,
                fontWeight: FontWeight.bold)),
        FormFieldData(
            id: passID,
            placeholder: "Password",
            isSecureText: true,
            error: "You must provide a password"),
        FormFieldData(
            id: zipID, placeholder: "Zip Code", minLength: 6, maxLength: 10),
        FormFieldData(
            id: dateID,
            placeholder: "Date",
            formatters: [
              FilteringTextInputFormatter.digitsOnly,
              DateInputFormatter()
            ],
            keyboardType: TextInputType.datetime)
      ];
  FormButtonData get button => FormButtonData(
        title: "Submit",
        height: 48,
        icon: Icons.send,
        titleStyle: const TextStyle(color: Colors.black),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );

  late final FormController formController;

  @override
  void initState() {
    formController = FormController(
        (fields) => _doWhateverWithFormValues(fields), fields, button);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Submit Form"),
      ),
      body: SafeArea(
        child: MagicForm(
            controller: formController, edgeInsets: const EdgeInsets.all(12)),
      ),
    );
  }

  void _doWhateverWithFormValues(Map<String, String> fields) {
    var result = "";
    fields.forEach((key, value) {
      result += "$key: $value \n";
    });
    Flushbar(
      title: "Form result",
      message: result,
      duration: const Duration(seconds: 10),
    ).show(context);
  }
}
