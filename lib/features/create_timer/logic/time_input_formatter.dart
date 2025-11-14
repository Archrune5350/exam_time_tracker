import 'package:flutter/services.dart';

class TimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length > 2 && text.length <= 4) {
      text = '${text.substring(0, 2)}:${text.substring(2)}';
    } else if (text.length > 4) {
      text = '${text.substring(0, 2)}:${text.substring(2, 4)}:${text.substring(4, text.length > 6 ? 6 : text.length)}';
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}