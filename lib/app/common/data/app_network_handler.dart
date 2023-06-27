import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';

import 'api_data_response.dart';

class NetworkHandler {
  NetworkHandler({
    required this.url,
    this.body,
    this.headerType,
    this.token,
  });

  final String url;
  final dynamic body;
  final String? headerType;
  final String? token;

  static Dio? dio;

  Map<String, String> getRequestHeaders() => <String, String>{
        "Content-Type": "application/octet-stream",
        "Authorization": token ?? '',
      };

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      // final dioOptions = dio!.options..followRedirects = true;

      dio!.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient(
            context: SecurityContext(),
          )..badCertificateCallback =
              (final cert, final host, final port) => true;
          return client;
        },
      );

      dio!.interceptors.add(dioLoggerInterceptor);
    }

    return dio!;
  }

  /// used debugPrint because [AppLog] would add unnecessary boxes around logs
  static final dioLoggerInterceptor = InterceptorsWrapper(
    onRequest: (final RequestOptions options, final handler) {
      debugPrint(
        "┌------------------------------------------------------------------------------",
      );
      debugPrint('| [DIO] Request: ${options.method} ${options.uri}');
      debugPrint('| ${options.data}');
      if (options.headers.isNotEmpty) {
        debugPrint('| Headers:');
        options.headers.forEach((final key, final value) {
          debugPrint('|\t$key: $value');
        });
      }
      debugPrint(
        "├------------------------------------------------------------------------------",
      );
      handler.next(options);
    },
    onResponse: (final Response response, final handler) {
      debugPrint(
        "| [DIO] Response [code ${response.statusCode}]: ${response.data}",
      );
      debugPrint(
        "└------------------------------------------------------------------------------",
      );
      handler.next(response);
    },
    // onError: (final DioError error, final handler) {
    /// uncomment this when updating Dio to Version 6
    onError: (final DioException error, final handler) {
      debugPrint("| [DIO] Error: ${error.error}: ${error.response}");
      debugPrint(
        "└------------------------------------------------------------------------------",
      );
      handler.reject(error);
    },
  );

  Future<ApiResponse?> get({
    final bool showErrorAutomatically = true,
    final bool isFromBackground = false,
  }) async {
    ApiResponse apiResponse;
    try {
      if (url.isNotEmpty) {
        final response = await getDio().get(
          url,
          options: Options(
            headers: getRequestHeaders(),
            validateStatus: (final int? status) {
              return status != null && status >= 200;
            },
          ),
        );

        apiResponse =
            _processResponse(response, isFromBackground: isFromBackground);
        return apiResponse;
      }
    } on Exception catch (e) {
      final ApiErrorCodes errorCode = _handleExceptions(
        e,
        showErrorAutomatically,
        isFromBackground: isFromBackground,
      );
      apiResponse = ApiResponse.error(errorCode: errorCode);
      showError(
        url,
        apiResponse.errorCode!,
        isFromBackground: isFromBackground,
        showErrorAutomatically: showErrorAutomatically,
      );
      return apiResponse;
    }
    return null;
  }

  Future<dynamic> post({
    final bool showErrorAutomatically = true,
    final bool isFromBackground = false,
  }) async {
    ApiResponse<dynamic>? apiResponse;
    try {
      if (url.isNotEmpty) {
        final Response<dynamic> response = await getDio().post(
          url,
          data: body,
          options: Options(
            headers: getRequestHeaders(),
            validateStatus: (final int? status) {
              return status != null && status >= 200;
            },
          ),
        );

        apiResponse =
            _processResponse(response, isFromBackground: isFromBackground);
      }
    } on Exception catch (e) {
      final ApiErrorCodes errorCode = _handleExceptions(
        e,
        showErrorAutomatically,
        isFromBackground: isFromBackground,
      );
      apiResponse = ApiResponse.error(errorCode: errorCode);
    }
    if (apiResponse != null &&
        !apiResponse.success &&
        apiResponse.errorCode != null) {
      showError(
        url,
        apiResponse.errorCode!,
        isFromBackground: isFromBackground,
      );
    }
    return apiResponse;
  }

  Future<dynamic> put({
    final bool showErrorAutomatically = true,
    final bool isFromBackground = false,
  }) async {
    ApiResponse<dynamic>? apiResponse;
    try {
      if (url.isNotEmpty) {
        final Response<dynamic> response = await getDio().put(
          url,
          data: body,
          options: Options(
            headers: getRequestHeaders(),
            validateStatus: (final int? status) {
              return status != null && status >= 200;
            },
          ),
        );

        apiResponse =
            _processResponse(response, isFromBackground: isFromBackground);
      }
    } on Exception catch (e) {
      final ApiErrorCodes errorCode = _handleExceptions(
        e,
        showErrorAutomatically,
        isFromBackground: isFromBackground,
      );
      apiResponse = ApiResponse.error(errorCode: errorCode);
    }
    if (apiResponse != null &&
        !apiResponse.success &&
        apiResponse.errorCode != null) {
      showError(
        url,
        apiResponse.errorCode!,
        isFromBackground: isFromBackground,
      );
    }
    return apiResponse;
  }

  void showError(
    final String apiURL,
    final ApiErrorCodes errorCodes, {
    final bool isFromBackground = false,
    final bool showErrorAutomatically = false,
  }) {
    if (!isFromBackground) {
      switch (errorCodes) {
        case ApiErrorCodes.DATA_FORMAT:
          // TODO: Handle this case.
          break;
        case ApiErrorCodes.HANDSHAKE:
          // TODO: Handle this case.

          break;
        case ApiErrorCodes.TIMEOUT:
          // TODO: Handle this case.
          break;
        case ApiErrorCodes.GENERAL:
          // TODO: Handle this case.
          break;
        case ApiErrorCodes.API_400:
          break;
        case ApiErrorCodes.API_401:
          // TODO: Handle this case.
          break;
        case ApiErrorCodes.API_403:
          // TODO: Handle this case.
          break;
        case ApiErrorCodes.API_404:
          break;
        case ApiErrorCodes.API_500:
          // TODO: Handle this case.
          break;
        case ApiErrorCodes.API_304:
          // TODO: Handle this case.
          break;
        case ApiErrorCodes.API_GENERAL:
          // TODO: Handle this case.
          break;
      }
    }
  }

  dynamic _processResponse(
    final Response<dynamic>? response, {
    final bool isFromBackground = false,
  }) {
    switch (response?.statusCode) {
      case 200:
        return ApiResponse<dynamic>.success(response!);
      case 201:
        return ApiResponse<dynamic>.success(response!);
      case 401:
        return ApiResponse<dynamic>.success(response!);
      case 400:
        return ApiResponse<dynamic>.failure(
          response!,
          errorCode: ApiErrorCodes.API_400,
        );

      case 404:
        return ApiResponse<dynamic>.failure(response!);

      case 304:
        return ApiResponse<dynamic>.failure(response!);

      case 500:
        // throw NoInternetConnectionException(
        //   message:
        //       Localization.of(g.Get.context ?? navigatorKey.currentContext!)
        //           .error_check_internet_connection,
        //   url: url,
        // );
        return ApiResponse<dynamic>.failure(
          response!,
          errorCode: ApiErrorCodes.TIMEOUT,
        );
    }
  }

  ApiErrorCodes _handleExceptions(
    final Exception error,
    final showErrorAutomatically, {
    final bool isFromBackground = false,
  }) {
    if (error is DioException) {
      final DioExceptionType errorDio = error.type;
      switch (errorDio) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiErrorCodes.TIMEOUT;
        case DioExceptionType.badCertificate:
        case DioExceptionType.badResponse:
          return ApiErrorCodes.DATA_FORMAT;
        case DioExceptionType.cancel:
        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          return ApiErrorCodes.GENERAL;
      }
    }
    if (error is TimeoutException) {
      return ApiErrorCodes.TIMEOUT;
    } else if (error is FormatException) {
      return ApiErrorCodes.DATA_FORMAT;
    } else if (error is HandshakeException) {
      return ApiErrorCodes.HANDSHAKE;
    } else {
      return ApiErrorCodes.GENERAL;
    }
  }
}
