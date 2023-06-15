import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarosal extends StatefulWidget {
  const MyCarosal({
    super.key,
  });

  @override
  State<MyCarosal> createState() => _MyCarosalState();
}

class _MyCarosalState extends State<MyCarosal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 8, right: 8),
      child: Stack(children: [
        InkWell(
          onTap: () {
            print(currentIndex);
          },
          child: CarouselSlider(
            items: imagetoCarosal(context),
            carouselController: carouselController,
            options: CarouselOptions(
              height: 300,
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: 2,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currentIndex == entry.key ? 17 : 7,
                    height: 7.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == entry.key
                            ? Colors.red
                            : Colors.teal),
                  ),
                );
              }).toList(),
            ))
      ]),
    );
  }
}

List<String> imageList = [
  "https://images.unsplash.com/photo-1534452203293-494d7ddbf7e0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c2hvcHBpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNob3BwaW5nfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1521291410923-42c74153b0f9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGxvdmUlMjBzaG9wfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"
];
final CarouselController carouselController = CarouselController();
int currentIndex = 0;

List<Widget> imagetoCarosal(BuildContext context) {
  return imageList
      .map((String e) => Container(
            // height: MediaQuery.of(context).size.height / 5,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                filterQuality: FilterQuality.high,
                image: NetworkImage(
                  e,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ))
      .toList();
}
