import 'package:get/get.dart';

import '../modules/animal_walls/bindings/animal_walls_binding.dart';
import '../modules/animal_walls/views/animal_walls_view.dart';
import '../modules/dark_walls/bindings/dark_walls_binding.dart';
import '../modules/dark_walls/views/dark_walls_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/nature_walls/bindings/nature_walls_binding.dart';
import '../modules/nature_walls/views/nature_walls_view.dart';
import '../modules/superhero_walls/bindings/superhero_walls_binding.dart';
import '../modules/superhero_walls/views/superhero_walls_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.DARK_WALLS,
      page: () => DarkWallsView(),
      binding: DarkWallsBinding(),
    ),
    GetPage(
      name: _Paths.NATURE_WALLS,
      page: () => NatureWallsView(),
      binding: NatureWallsBinding(),
    ),
    GetPage(
      name: _Paths.ANIMAL_WALLS,
      page: () => AnimalWallsView(),
      binding: AnimalWallsBinding(),
    ),
    GetPage(
      name: _Paths.SUPERHERO_WALLS,
      page: () => SuperheroWallsView(),
      binding: SuperheroWallsBinding(),
    ),
  ];
}
