import 'package:flutter/material.dart';
import '../../../theme/colors.dart';

class AuthTextField extends StatelessWidget {
   AuthTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validator
  });
  final TextEditingController controller;
  final String labelText;
 final  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        validator:validator,
        controller: controller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: Pallete.pureblack,
                width: 3,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: Pallete.unselectedNavBarColor,
              ),
            ),
            contentPadding: const EdgeInsets.all(20),
            labelText: labelText,
            labelStyle: const TextStyle(color: Pallete.pureblack)),
      ),
    );
  }
}
