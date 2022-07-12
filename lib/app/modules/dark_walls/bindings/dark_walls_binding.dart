import 'package:get/get.dart';

import '../controllers/dark_walls_controller.dart';

class DarkWallsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DarkWallsController>(
      () => DarkWallsController(),
    );
  }
}
