import 'package:flutter/material.dart';

import '../../../common/alltextfields.dart';

class TitleWithImage extends StatelessWidget {
  const TitleWithImage({
    super.key,
    required this.title,
    required this.productimg,
    required this.onTap,
  });

  final String title;
  final String productimg;
  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        height: 400,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TheBoldText(thetile: title, size: 24),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(productimg))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
