import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueLength = newValue.text.length;

    if (newValueLength > 8) {
      return oldValue;
    }

    var selectionIndex = newValue.selection.end;
    var substrIndex = 0;
    final newText = StringBuffer();

    if (newValueLength >= 3) {
      newText.write('${newValue.text.substring(0, substrIndex = 2)}/');
      if (newValue.selection.end >= 2) selectionIndex++;
    }
    if (newValueLength >= 5) {
      newText.write('${newValue.text.substring(2, substrIndex = 4)}/');
      if (newValue.selection.end >= 4) selectionIndex++;
    }
    if (newValueLength >= substrIndex) {
      newText.write(newValue.text.substring(substrIndex));
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}