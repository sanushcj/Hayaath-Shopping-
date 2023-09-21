import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:hayaath_shopping/core/utilitiies.dart';
import 'package:hayaath_shopping/model/productmodel.dart';

class AdminServices {
  sellmyProduct(
      {required BuildContext context,
      required String name,
      required String description,
      required double price,
      required double quantity,
      required String Category,
      required List<File> img}) async {
    try {
      var cloudinary = CloudinaryPublic('duslo3yp6', 'ohfdhtyo');
      List<String> imageUrls = [];
      for (var i = 0; i < img.length; i++) {
        CloudinaryResponse result = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(img[i].path, folder: name),
        );
        imageUrls.add(result.secureUrl);
      }
      ProductModel product = ProductModel(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: Category,
          price: price);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
