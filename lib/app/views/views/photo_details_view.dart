import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:omega_walls/app/data/Colors/app_colors.dart';
import 'package:omega_walls/app/data/Model/firebase_model.dart';

class PhotoDetailsView extends GetView {
  FirebaseModel? files;
  int? index;
  PhotoDetailsView({required this.files, required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: Stack(
          children: [
            Hero(
              tag: index!,
              child: CachedNetworkImage(
                imageUrl: files!.url!,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height / 50,
                child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    )))
          ],
          alignment: Alignment.topLeft,
        ));
  }
}
