import 'package:flutter_getx_template/app/modules/home/domain/entities/home_network_entity.dart';

abstract class HomeRepository {
  Future<HomeNetworkEntity?> fetchData(String url);
}
