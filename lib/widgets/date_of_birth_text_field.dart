import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateOfBirthTextField extends StatelessWidget {
  // const DateOfBirthTextField({super.key});
  final TextEditingController controller;
  DateOfBirthTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "ວັນ,ເດືອນ,ປີເກີດ (dd-mm-yyyy)",
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            DateInputFormatter(),
          ],
        ),
      ),
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    String formattedText = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 2 || i == 4) {
        formattedText += '-';
      }
      formattedText += digitsOnly[i];
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
