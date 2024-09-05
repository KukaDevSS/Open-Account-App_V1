import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.isPassword = false, 
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: InputBorder.none,
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
