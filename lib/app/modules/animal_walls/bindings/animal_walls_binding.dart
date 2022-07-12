import 'package:get/get.dart';

import '../controllers/animal_walls_controller.dart';

class AnimalWallsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimalWallsController>(
      () => AnimalWallsController(),
    );
  }
}
