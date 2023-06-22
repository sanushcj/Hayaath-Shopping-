import 'package:flutter/material.dart';

import '../theme/colors.dart';

// ignore: must_be_immutable
class NormalText extends StatelessWidget {
  NormalText({super.key, required this.thetext, this.color, this.size});
  final String thetext;
  Color? color;
  double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      thetext,
      style: TextStyle(color: color ?? Pallete.pureblack, fontSize: size ?? 15),
    );
  }
}

class TheBoldText extends StatelessWidget {
  const TheBoldText({
    super.key,
    required this.thetile,
    required this.size,
  });
  final String thetile;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      thetile,
      style: TextStyle(
          fontSize: size,
          color: Pallete.pureblack,
          fontWeight: FontWeight.w600),
    );
  }
}
