import 'package:flutter/material.dart';
import 'package:magic_forms_example/app.dart';
import 'package:magic_forms_example/forms/auto_validate_form.dart';
import 'package:magic_forms_example/forms/custom_field_form.dart';
import 'package:magic_forms_example/forms/custom_submit_form.dart';
import 'package:magic_forms_example/forms/simple_form.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: "/app",
      routes: {
        "/app": (context) => const MagicFormExampleApp(),
        "/simpleExample": (context) => const SimpleFormScreen(),
        "/customFieldExample": (context) => const CustomFieldFormScreen(),
        "/customButtomExample": (context) => const CustomSubmitFormScreen(),
        "/autoValidateExample": (context) => const AutoValidateFormScreen()
      },
    );
  }
}
