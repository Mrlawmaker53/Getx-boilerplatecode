import 'package:flutter_getx_template/app/modules/home/data/models/home_network_model.dart';
import 'package:flutter_getx_template/app/modules/home/data/provider/home_provider.dart';
import 'package:flutter_getx_template/app/modules/home/domain/entities/home_network_entity.dart';

import 'package:flutter_getx_template/app/common/data/api_data_response.dart';

import '../../domain/repository/home_repository.dart';


class HomeRepositoryImpl implements HomeRepository {
  final HomeProvider _homeProvider;
  HomeRepositoryImpl(this._homeProvider);

  @override
  Future<HomeNetworkEntity?> fetchData(String url) async {
    try {
      final ApiResponse<HomeNetworkModel>? _result =
          await _homeProvider.fetchData(url);
      if (_result != null && _result.code == 200 && _result.body != null) {
        return _result.body!.mapToEntity();
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }
}
