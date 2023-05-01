import 'package:flutter/material.dart';

class MagicFormExampleApp extends StatefulWidget {
  const MagicFormExampleApp({super.key});

  @override
  _MagicFormExampleAppState createState() => _MagicFormExampleAppState();
}

class _MagicFormExampleAppState extends State<MagicFormExampleApp> {
  final List<_MagicFormExampleListModel> model = [
    _MagicFormExampleListModel("Simple", "/simpleExample"),
    _MagicFormExampleListModel("Custom Field", "/customFieldExample"),
    _MagicFormExampleListModel("Custom Buttom", "/customButtomExample"),
    _MagicFormExampleListModel("Auto Validate Form", "/autoValidateExample")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          children: [
            const Text(
              "Magic Form Examples",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: model.length,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _row(model[index], context)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(_MagicFormExampleListModel model, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, model.route),
      child: AbsorbPointer(
        child: Container(
          height: 48,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              model.name,
              style: const TextStyle(color: Colors.blueAccent, fontSize: 18),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.blueAccent,
            )
          ]),
        ),
      ),
    );
  }
}

class _MagicFormExampleListModel {
  final String name;
  final String route;

  _MagicFormExampleListModel(this.name, this.route);
}
