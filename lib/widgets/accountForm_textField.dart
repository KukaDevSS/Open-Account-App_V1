import 'package:flutter/material.dart';

class AccountFormTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  const AccountFormTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      validator: validator,
    );
  }
}
