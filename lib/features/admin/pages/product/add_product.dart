import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hayaath_shopping/common/alltextfields.dart';
import 'package:hayaath_shopping/features/admin/pages/product/widgets/addPproduct_screen_widgets.dart';
import 'package:hayaath_shopping/theme/colors.dart';

import '../../../../core/utilitiies.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({super.key});
  static const routeName = '/add-product';

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String category = 'Mobiles';

  final _addProductFormKey = GlobalKey<FormState>();

  List<File> product_images = [];

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  TextEditingController _productnameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _offerPriceController = TextEditingController();

  @override
  void dispose() {
    _productnameController.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _offerPriceController.dispose();
    super.dispose();
  }



  void selectImages() async {
    var result = await ProductpickImages();
    setState(() {
      product_images = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.dryBlue,
        title: NormalText(
          thetext: 'Add Product',
          color: Pallete.whiteColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: selectImages,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.folder_open,
                                size: 40,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Select Product Images',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  AddProTextField(
                    controller: _productnameController,
                    hint: 'Product Name',
                    keyboardtype: TextInputType.name,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: Pallete.purpleColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(20),
                      underline: SizedBox(),
                      dropdownColor: Pallete.iceBlue,
                      hint: Text('Category'),
                      value: category,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Pallete.pureblack,
                      ),
                      items: productCategories.map((String item) {
                        return DropdownMenuItem(
                          alignment: Alignment.center,
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
                  ),
                  AddProTextField(
                    controller: _descriptionController,
                    maxlines: 7,
                    hint: 'Describe about your product',
                  ),
                  AddProTextField(
                    controller: _quantityController,
                    hint: 'Quantity',
                    keyboardtype:
                        TextInputType.numberWithOptions(decimal: false),
                  ),
                  AddProTextField(
                    controller: _priceController,
                    hint: 'Price',
                    keyboardtype: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
