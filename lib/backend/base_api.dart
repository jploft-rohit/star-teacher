import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as X;
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class BaseAPI {
  late Dio _dio;
  static final BaseAPI _singleton = BaseAPI._internal();

  factory BaseAPI() {
    return _singleton;
  }

  BaseAPI._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://3.28.14.143:4000/star-backend/api/',
        connectTimeout: 60000,
        receiveTimeout: 60000,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    _dio.interceptors.add(LogInterceptor(responseBody: true,request: true,requestBody: true));

  }

  /// GET Method
  Future<Response?> get({required String url, Map<String, dynamic>? queryParameters,bool? showLoader,bool? showErrorSnackbar}) async {
    if (await checkInternetConnection()) {
      try {
        BaseOverlays().showLoader(showLoader: showLoader??true);
        FocusScope.of(X.Get.context!).requestFocus(new FocusNode());
        final String token = await BaseSharedPreference().getString(SpKeys().apiToken);
        final response = await _dio.get(url, options: Options(headers: {"Authorization": "Bearer $token"}),queryParameters: queryParameters);
        BaseOverlays().dismissOverlay(showLoader: showLoader??true);
        return response;
      } on DioError catch (e) {
        BaseOverlays().dismissOverlay(showLoader: showLoader??true);
        _handleError(e,showErrorSnackbar: showErrorSnackbar??true);
        rethrow;
      }
    }else{
      BaseOverlays().showSnackBar(message: translate(X.Get.context!).no_internet_connection);
      return null;
    }
  }

  /// POST Method
  Future<Response?> post({required String url, dynamic data, Map<String, dynamic>? headers,bool? showLoader}) async {
    if (await checkInternetConnection()) {
      try {
        BaseOverlays().showLoader(showLoader: showLoader);
        FocusScope.of(X.Get.context!).requestFocus(new FocusNode());
        final String token = await BaseSharedPreference().getString(SpKeys().apiToken)??"";
        final response = await _dio.post(url, data: data, options: Options(headers: headers??{"Authorization": "Bearer $token"}));
        BaseOverlays().dismissOverlay(showLoader: showLoader);
        return response;
      } on DioError catch (e) {
        BaseOverlays().dismissOverlay(showLoader: showLoader);
        _handleError(e);
        rethrow;
      }
    }else{
      // BaseDialogs().dismissLoader();
      BaseOverlays().showSnackBar(message: translate(X.Get.context!).no_internet_connection);
      return null;
    }
  }

  /// PUT Method
  Future<Response?> put({required String url, dynamic data, Map<String, dynamic>? headers,bool? showLoader}) async {
    if (await checkInternetConnection()) {
      try {
        BaseOverlays().showLoader(showLoader: showLoader);
        FocusScope.of(X.Get.context!).requestFocus(new FocusNode());
        final String token = await BaseSharedPreference().getString(SpKeys().apiToken)??"";
        final response = await _dio.put(url, data: data, options: Options(headers: headers??{"Authorization": "Bearer $token"}));
        BaseOverlays().dismissOverlay(showLoader: showLoader);
        return response;
      } on DioError catch (e) {
        BaseOverlays().dismissOverlay(showLoader: showLoader);

        _handleError(e);
        rethrow;
      }
    }else{
      // BaseDialogs().dismissLoader();
      BaseOverlays().showSnackBar(message: translate(X.Get.context!).no_internet_connection);
      return null;
    }
  }

  /// PATCH Method
  Future<Response?> patch({required String url, dynamic data, Map<String, dynamic>? headers,bool? concatUserId}) async {
    if (await checkInternetConnection()) {
      try {
        BaseOverlays().showLoader();
        FocusScope.of(X.Get.context!).requestFocus(new FocusNode());
        final String token = await BaseSharedPreference().getString(SpKeys().apiToken)??"";
        final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
        final response = await _dio.patch(url+((concatUserId??false) ? userId : ""), data: data, options: Options(headers: headers??{"Authorization": "Bearer $token"}));
        BaseOverlays().dismissOverlay();
        return response;
      } on DioError catch (e) {
        BaseOverlays().dismissOverlay();
        _handleError(e);
        rethrow;
      }
    }else{
      // BaseDialogs().dismissLoader();
      BaseOverlays().showSnackBar(message: translate(X.Get.context!).no_internet_connection);
      return null;
    }
  }

  /// Delete Method
  Future<Response?> delete({required String url, Map<String, dynamic>? headers, dynamic data}) async {
    FocusScope.of(X.Get.context!).requestFocus(FocusNode());
    if (await checkInternetConnection()) {
      try {
        BaseOverlays().showLoader();
        final String token = await BaseSharedPreference().getString(SpKeys().apiToken);
        final response = await _dio.delete(url, data: data, options: Options(headers: headers??{"Authorization": "Bearer $token"}));
        BaseOverlays().dismissOverlay();
        return response;
      } on DioError catch (e) {
        BaseOverlays().dismissOverlay();
        _handleError(e);
        rethrow;
      }
    }else{
      // BaseDialogs().dismissLoader();
      BaseOverlays().showSnackBar(message: translate(X.Get.context!).no_internet_connection);
      return null;
    }
  }

  Future<Response?> deleteWithQueryParam({required String url, Map<String, dynamic>? headers, dynamic data}) async {
    FocusScope.of(X.Get.context!).requestFocus(FocusNode());
    if (await checkInternetConnection()) {
      try {
        BaseOverlays().showLoader();
        final String token = await BaseSharedPreference().getString(SpKeys().apiToken);
        final response = await _dio.delete(url, queryParameters: data, options: Options(headers: headers??{"Authorization": "Bearer $token"}));
        BaseOverlays().dismissOverlay();
        return response;
      } on DioError catch (e) {
        BaseOverlays().dismissOverlay();
        _handleError(e);
        rethrow;
      }
    }else{
      // BaseDialogs().dismissLoader();
      BaseOverlays().showSnackBar(message: translate(X.Get.context!).no_internet_connection);
      return null;
    }
  }

  /// Download Method
  Future<Response> download(String url, String savePath, {Map<String, dynamic>? headers, void Function(int, int)? onReceiveProgress}) async {
    checkInternetConnection();
    try {
      final response = await _dio.download(url, savePath,
          options: Options(headers: headers),
          onReceiveProgress: onReceiveProgress);
      return response;
    } on DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Check Internet Connection
  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }else{
        log("No internet connection");
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<dynamic> postFormDataMedical(String url, Map<String, dynamic> formData,
      {Map<String, dynamic>? headers,
        Function(int, int)? onSendProgress}) async {
    try {
      final dio = Dio();
      final form = FormData();

      formData.forEach((key, value) {
        if (value is String) {
          form.fields.add(MapEntry(key, value));
        } else if (value is MultipartFile) {
          form.files.add(MapEntry(key, value));
        }
      });
      final String token = await BaseSharedPreference().getString(SpKeys().apiToken)??"";
      final response = await _singleton._dio.post(url, data: form, options: Options(headers: headers??{"Authorization": "Bearer $token"}),
        onSendProgress: onSendProgress,
      );

      return response;
    } on DioError catch (e) {
      // String message = _singleton._handleError(e);
      throw e.message;
    }
  }


  Future<Response> postFormData(String url, Map<String, dynamic> formData, String type, {Map<String, dynamic>? headers, bool? showLoader}) async {
    BaseOverlays().showLoader(showLoader: showLoader);
    FocusScope.of(X.Get.context!).requestFocus(new FocusNode());
    try {
      final String token = await BaseSharedPreference().getString(SpKeys().apiToken) ?? "";
      var response;
      if (type == "post") {
        response = await _dio.post(url, data: FormData.fromMap(formData), options: Options(headers: headers ?? {"Authorization": "Bearer $token"}));
      }
      if (type == "patch") {
        response = await _dio.patch(url, data: FormData.fromMap(formData), options: Options(headers: headers ?? {"Authorization": "Bearer $token"}));
      }
      if (type == "put") {
        response = await _dio.put(url, data: FormData.fromMap(formData), options: Options(headers: headers ?? {"Authorization": "Bearer $token"}));
      }
      // BaseOverlays().dismissOverlay(showLoader: showLoader);
      X.Get.back();
      return response;
    } on DioError catch (e) {
      X.Get.back();
      // BaseOverlays().dismissOverlay(showLoader: showLoader);
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> uploadFile(File file, String url,
      {Function(int, int)? onSendProgress}) async {
    try {
      final formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path),
      });
      final response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "multipart/form-data",
          },
        ),
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> uploadMultipleFiles(List<File> files, String url, {Function(int, int)? onSendProgress}) async {
    final dio = Dio();

    final formData = FormData();

    for (int i = 0; i < files.length; i++) {
      final file = files[i];
      formData.files.add(MapEntry("file$i", await MultipartFile.fromFile(file.path)));
    }

    return dio.post(url, data: formData, onSendProgress: onSendProgress);
  }

  void _handleError(DioError e,{bool? showErrorSnackbar}) {
    if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout || e.type == DioErrorType.sendTimeout) {
      // Handle timeout error
      log('Timeout Error: ${e.message}');
    } else if (e.type == DioErrorType.other) {
      // Handle response error
      log('Bad Response Error: ${e.message}');
      if (showErrorSnackbar??true) {
        BaseOverlays().showSnackBar(message: (e.response?.data['message']));
      }
    } else if (e.type == DioErrorType.cancel) {
      // Handle cancel error
      log('Request Cancelled Error: ${e.message}');
    } else {
      // Handle other errors
      log('Unknown Error: ${e.response?.data["message"]}');
      if ((e.response?.data["message"].toString()??"").isNotEmpty) {
        if (showErrorSnackbar??true) {
          BaseOverlays().showSnackBar(message: e.response?.data["message"]);
        }
      }
    }
  }
}
