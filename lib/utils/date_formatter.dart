import 'package:flutter/services.dart';

class DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int selectionIndex;

    String pText = oldValue.text;
    String cText = newValue.text;
    int cLen = cText.length;
    int pLen = pText.length;

    if (cLen == 1) {
      if (int.parse(cText) > 3) {
        cText = '';
      }
    } else if (cLen == 2 && pLen == 1) {
      int dd = int.parse(cText.substring(0, 2));
      if (dd == 0 || dd > 31) {
        cText = cText.substring(0, 1);
      } else {
        cText += '.';
      }
    } else if (cLen == 4) {
      if (int.parse(cText.substring(3, 4)) > 1) {
        cText = cText.substring(0, 3);
      }
    } else if (cLen == 5 && pLen == 4) {
      int mm = int.parse(cText.substring(3, 5));
      if (mm == 0 || mm > 12) {
        cText = cText.substring(0, 4);
      } else {
        cText += '.';
      }
    } else if ((cLen == 3 && pLen == 4) || (cLen == 6 && pLen == 7)) {
      cText = cText.substring(0, cText.length - 1);
    } else if (cLen == 3 && pLen == 2) {
      if (int.parse(cText.substring(2, 3)) > 1) {
        cText = cText.substring(0, 2) + '.';
      } else {
        cText =
            cText.substring(0, pLen) + '.' + cText.substring(pLen, pLen + 1);
      }
    } else if (cLen == 6 && pLen == 5) {
      int y1 = int.parse(cText.substring(5, 6));
      if (y1 < 1 || y1 > 2) {
        cText = cText.substring(0, 5) + '.';
      } else {
        cText = cText.substring(0, 5) + '.' + cText.substring(5, 6);
      }
    } else if (cLen == 7) {
      int y1 = int.parse(cText.substring(6, 7));
      if (y1 < 1 || y1 > 2) {
        cText = cText.substring(0, 6);
      }
    } else if (cLen == 8) {
      int y2 = int.parse(cText.substring(6, 8));
      if (y2 < 19 || y2 > 20) {
        cText = cText.substring(0, 7);
      }
    }

    selectionIndex = cText.length;
    return TextEditingValue(
      text: cText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
