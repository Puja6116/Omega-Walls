import 'package:get/get.dart';

import '../controllers/superhero_walls_controller.dart';

class SuperheroWallsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuperheroWallsController>(
       ()=>SuperheroWallsController(),
    );
  }
}
