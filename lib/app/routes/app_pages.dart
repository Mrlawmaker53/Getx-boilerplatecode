import 'package:get/get.dart';

import '../modules/home/presentation/bindings/home_binding.dart';
import '../modules/home/presentation/views/home_view.dart';

part 'app_routes.dart';

abstract class AppPages {
  const AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
