// ignore_for_file: constant_identifier_names

import "package:dio/dio.dart";


class ApiResponse<T> {
  ApiResponse.success(Response<T> response) {
    code = response.statusCode ?? 0;
    statusMsg = response.statusMessage ?? "";
    body = (response.data ?? "") as T;
    headers = response.headers;
    success = true;
  }

  ApiResponse.failure(
    final Response<T> response, {
    this.errorCode,
  }) {
    code = response.statusCode ?? 0;
    statusMsg = response.statusMessage ?? "Error";
    success = false;
    body = (response.data ?? {}) as T;
    headers = response.headers;
    errorCode = errorCode;
  }

  ApiResponse.error({this.errorCode}) {
    success = false;
    errorCode = errorCode;
  }

  int code = 0;
  String statusMsg = "";
  T? body;
  String? error;
  bool success = true;
  Headers? headers;
  ApiErrorCodes? errorCode;
}

enum ApiErrorCodes {
  DATA_FORMAT(isException: true),
  HANDSHAKE(isException: true),
  TIMEOUT(isException: true),
  GENERAL(isException: true),
  API_400(isException: false),
  API_401(isException: false),
  API_403(isException: false),
  API_404(isException: false),
  API_500(isException: false),
  API_304(isException: false),
  API_GENERAL(isException: false),
  ;

  const ApiErrorCodes({required this.isException});

  final bool isException;
}
