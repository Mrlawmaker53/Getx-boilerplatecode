import 'package:flutter_getx_template/app/common/data/api_data_response.dart';
import 'package:flutter_getx_template/app/modules/home/data/models/home_network_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class HomeService extends GetxService {
  Future<ApiResponse<HomeNetworkModel>?> fetchData(String url) async {
    dio.Response<HomeNetworkModel> res = dio.Response<HomeNetworkModel>(
      statusCode: 200,
      data: HomeNetworkModel(
        id: 1,
        email: 'hamza.k@email.com',
        firstName: 'hamza',
        lastName: 'kaydawala',
        avatar: 'clever',
      ),
      requestOptions: dio.RequestOptions(),
    );
    ApiResponse<HomeNetworkModel> response = ApiResponse.success(res);
    return response;
    // return await NetworkHandler(
    //   url: url,
    // ).get() as ApiResponse<HomeNetworkModel>?;
  }
}
