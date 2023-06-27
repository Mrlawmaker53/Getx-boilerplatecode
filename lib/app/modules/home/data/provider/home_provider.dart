import 'package:get/get.dart';

import '../../../../common/data/api_data_response.dart';
import '../models/home_network_model.dart';
import '../service/home_service.dart';

class HomeProvider extends GetxService {
  final HomeService _homeService;
  HomeProvider(this._homeService);

  Future<ApiResponse<HomeNetworkModel>?> fetchData(String url) async =>
      await _homeService.fetchData(url);
}
