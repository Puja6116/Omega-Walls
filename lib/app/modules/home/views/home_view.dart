import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wallpaper,
            size: 40,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          CircularProgressIndicator(),
        ],
      ))),
    );
  }
}
