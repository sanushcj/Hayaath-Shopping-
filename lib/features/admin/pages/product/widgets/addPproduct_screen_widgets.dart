import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../common/alltextfields.dart';
import '../../../../../theme/colors.dart';

// ignore: must_be_immutable
class AddProTextField extends StatelessWidget {
  AddProTextField(
      {super.key,
      required this.controller,
      this.maxlines = 1,
      required this.hint,
      this.keyboardtype = TextInputType.text});

  TextEditingController controller = TextEditingController();

  final int maxlines;
  final String hint;
  final TextInputType keyboardtype;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: (value) => log(
            '${controller.toString()}  hellooooooooooooooooooooooooooooooooooooooooooooooo'),
        keyboardType: keyboardtype,
        maxLines: maxlines,
        style: TextStyle(color: Pallete.pureblack),
        controller: controller,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Pallete.redColor, width: 2),
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Pallete.pureblack),
          filled: true,
          fillColor: Pallete.greyColor.withOpacity(0.2),
          border: OutlineInputBorder(borderSide: BorderSide()),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Pallete.premium),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Pallete.pureblack),
          ),
        ),
      ),
    );
  }
}

class AddProductCategory extends StatefulWidget {
  const AddProductCategory({super.key});

  @override
  State<AddProductCategory> createState() => _AddProductCategoryState();
}

class _AddProductCategoryState extends State<AddProductCategory> {
  String category = 'Mobiles';
  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          color: Pallete.purpleColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(25),
          border: Border.all()),
      child: DropdownButton(
        underline: SizedBox(),
        dropdownColor: Pallete.iceBlue,
        value: category,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Pallete.pureblack,
        ),
        items: productCategories.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: NormalText(
              thetext: item,
              color: Pallete.pureblack,
            ),
          );
        }).toList(),
        onChanged: (String? newCat) {
          setState(() {
            category = newCat!;
          });
        },
      ),
    );
  }
}
