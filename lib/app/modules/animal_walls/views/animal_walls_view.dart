import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/Colors/app_colors.dart';
import '../controllers/animal_walls_controller.dart';

class AnimalWallsView extends GetView<AnimalWallsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text('AnimalWallsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AnimalWallsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
