import 'package:flutter/material.dart';
import 'package:magic_forms/components/form_field_view.dart';
import 'package:magic_forms/components/form_submit_button.dart';
import 'package:magic_forms/forms/form_view.dart';

class MagicFormState extends State<FormView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: widget.edgeInsets ?? const EdgeInsets.all(16),
      children: [
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.controller.fields.length,
          itemBuilder: (context, index) {
            final field = widget.controller.fields[index];
            final controller = widget.controller.controllers[field.id]!;
            final validator = widget.controller.isAutoValidation
                ? widget.controller.autoValidators[field.id]!
                : widget.controller.validators[field.id]!;
            return Padding(
              padding: widget.innerInsets ?? const EdgeInsets.only(bottom: 8),
              child: FormFieldView(
                controller: controller,
                isValid: validator,
                data: field,
              ),
            );
          },
        ),
        SizedBox(height: widget.controller.button.topPad ?? 16),
        FormSubmitButton(
          onTap: () => widget.controller.validate(),
          data: widget.controller.button,
          isValid: widget.controller.enabledButton,
        )
      ],
    );
  }
}
