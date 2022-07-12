import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/Colors/app_colors.dart';
import '../controllers/dark_walls_controller.dart';

class DarkWallsView extends GetView<DarkWallsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text('DarkWallsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DarkWallsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
