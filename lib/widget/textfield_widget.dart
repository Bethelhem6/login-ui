import 'package:flutter/material.dart';

import '../constants/exports.dart';

class LineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? right;
  final String? Function(String? field) validator;
  // final String? Function(String? field) onChange;
  final FocusNode? focusNode;

  const LineTextField({
    super.key,
    required this.placeholder,
    required this.controller,
    this.right,
    this.keyboardType,
    this.obscureText = false,
    required this.validator,
    // required this.onChange,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkGray),
      controller: controller,
      autofocus: true,

      keyboardType: keyboardType,
      focusNode: focusNode,
      obscureText: obscureText,
      decoration: InputDecoration(
        focusColor: AppColors.ligtGray,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        suffixIcon: right,
        label: Text(placeholder),
        labelStyle: TextStyle(
            color: AppColors.ligtGray,
            fontSize: AppFont.mediumText,
            fontWeight: FontWeight.bold),
        // hintText: placeholder,
        hintStyle: TextStyle(
            color: AppColors.ligtGray,
            fontSize: AppFont.mediumText,
            fontWeight: FontWeight.bold),
      ),
      // onChanged: onChange,
      validator: validator,
    );
  }
}
