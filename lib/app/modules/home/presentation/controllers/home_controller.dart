import 'package:get/get.dart';

import '../../data/repository/home_repository_impl.dart';

class HomeController extends GetxController {
  final HomeRepositoryImpl _repository;

  HomeController(this._repository);

  @override
  void onReady() {
    super.onReady();

    _loadData();
  }

  void _loadData() async {
    dynamic x = await _repository.fetchData("www.hitapi.com");
    print(x);
  }
}
