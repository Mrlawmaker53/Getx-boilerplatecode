import 'package:flutter_getx_template/app/modules/home/data/provider/home_provider.dart';
import 'package:flutter_getx_template/app/modules/home/data/service/home_service.dart';
import 'package:get/get.dart';

import '../../data/repository/home_repository_impl.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeService>(HomeService());
    Get.put<HomeProvider>(HomeProvider(Get.find()));
    Get.put<HomeRepositoryImpl>(HomeRepositoryImpl(Get.find()));
    Get.put<HomeController>(HomeController(Get.find()));
  }
}
