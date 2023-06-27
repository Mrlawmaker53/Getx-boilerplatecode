import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/home/presentation/views/dashhoard.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Hi"),
          ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.DASHBOARD);
              },
              child: Text('Next Screen'))
        ],
      ),
    );
  }
}
