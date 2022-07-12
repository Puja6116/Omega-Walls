import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/Colors/app_colors.dart';
import '../controllers/nature_walls_controller.dart';

class NatureWallsView extends GetView<NatureWallsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text('NatureWallsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NatureWallsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
