import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePickerTextField extends StatefulWidget {
  // const CustomImagePickerTextField({super.key});
  final TextEditingController controller;
  final String hintText;

  const CustomImagePickerTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  State<CustomImagePickerTextField> createState() =>
      _CustomImagePickerTextFieldState();
}

class _CustomImagePickerTextFieldState
    extends State<CustomImagePickerTextField> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        widget.controller.text =
            pickedFile.path; 
      });
    }
  }

  void _showSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take Photo'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Choose from Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          _showSelectionDialog(context);
        },
        child: AbsorbPointer(
          child: Container(
            // color: Colors.white,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!)),
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                suffixIcon: _image != null
                    ? Image.file(_image!)
                    : Icon(Icons.camera_alt),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
