import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class DashboardView extends GetView {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('DashboardView'),
      ),
    );
  }
}
