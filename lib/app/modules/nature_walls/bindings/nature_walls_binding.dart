import 'package:get/get.dart';

import '../controllers/nature_walls_controller.dart';

class NatureWallsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NatureWallsController>(
      () => NatureWallsController(),
    );
  }
}
