import 'dart:async';

import 'package:get/get.dart';
import 'package:omega_walls/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
    Timer(
        const Duration(
          seconds: 1,
        ),
        () => Get.offAllNamed(Routes.WELCOME));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
