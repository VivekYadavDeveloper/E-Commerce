import 'package:flutter/material.dart';

class CustomTextfeild extends StatefulWidget {
  String? hintText;
  String? initialText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  CustomTextfeild({super.key, this.hintText, this.validator, this.controller, this.initialText});

  @override
  State<CustomTextfeild> createState() => _CustomTextfeildState();
}

class _CustomTextfeildState extends State<CustomTextfeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialText,
      controller: widget.controller,
      validator: widget.validator,
      maxLines: 1,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
