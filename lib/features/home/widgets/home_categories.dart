import 'package:flutter/material.dart';
import '../../../theme/colors.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key, required this.name, required this.img});

  final String name;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Pallete.transparent,
            backgroundImage: NetworkImage(
              img,
            ),
            radius: 35,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(color: Pallete.pureblack),
          )
        ],
      ),
    );
  }
}
