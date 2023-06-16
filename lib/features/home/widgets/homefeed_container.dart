import 'package:flutter/material.dart';
import 'package:hayaath_shopping/theme/colors.dart';

import '../../../common/alltextfields.dart';
import '../../../constants/global_variables.dart';

class DefaultFeedContainer extends StatelessWidget {
  const DefaultFeedContainer({
    super.key,
    required this.title1,
    required this.productimg1,
    required this.onTap1,
    required this.title2,
    required this.productimg2,
    required this.onTap2,
    required this.title3,
    required this.productimg3,
    required this.onTap3,
    required this.title4,
    required this.productimg4,
    required this.onTap4,
    required this.maintitle,
    required this.maintitlesize,
    this.seeall,
  });

  final String maintitle;
  final double maintitlesize;
  final seeall;

  final String title1;
  final String productimg1;
  final String onTap1;

  final String title2;
  final String productimg2;
  final String onTap2;

  final String title3;
  final String productimg3;
  final String onTap3;

  final String title4;
  final String productimg4;
  final String onTap4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TheBoldText(size: maintitlesize, thetile: maintitle),
                TextButton(
                    onPressed: () {},
                    child: NormalText(
                      thetext: 'See all',
                      color: Pallete.dryBlue,
                    ))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProductContainerFeed(
                title: title1,
                img: productimg1,
                ontap: onTap1,
              ),
              ProductContainerFeed(
                title: title2,
                img: productimg2,
                ontap: onTap2,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProductContainerFeed(
                title: title3,
                img: productimg3,
                ontap: onTap3,
              ),
              ProductContainerFeed(
                title: title4,
                img: productimg4,
                ontap: onTap4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductContainerFeed extends StatelessWidget {
  const ProductContainerFeed({
    super.key,
    required this.title,
    required this.img,
    required this.ontap,
  });
  final String title;
  final String img;
  final String ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => ontap,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(img))),
            ),
          ),
          rrHeight10,
          NormalText(
            thetext: title,
          )
        ],
      ),
    );
  }
}
