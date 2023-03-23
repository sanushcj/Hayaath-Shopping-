import 'package:flutter/material.dart';
import '../theme/colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.onTap,
    required this.label,
    this.backgroundColor = Pallete.purpleColor,
    this.textColor = Pallete.whiteColor,
  });

  final String label;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
        backgroundColor: backgroundColor,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
      ),
    );
  }
}
