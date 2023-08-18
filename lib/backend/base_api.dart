import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as X;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class BaseAPI {
  late Dio _dio;
  String languageCode = "";
  static final BaseAPI _singleton = BaseAPI._internal();

  factory BaseAPI() {
    return _singleton;
  }

  BaseAPI._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints().baseUrl,
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
        languageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
        FocusScope.of(X.Get.context!).requestFocus(new FocusNode());
        final String token = await BaseSharedPreference().getString(SpKeys().apiToken)??"";
        final response = await _dio.get(url, options: Options(headers: {"Authorization": "Bearer $token", "Accept-Language":languageCode}), queryParameters: queryParameters);
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
        languageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
        FocusScope.of(X.Get.context!).requestFocus(new FocusNode());
        final String token = await BaseSharedPreference().getString(SpKeys().apiToken)??"";
        final response = await _dio.post(url, data: data, options: Options(headers: headers??{"Authorization": "Bearer $token", "Accept-Language":languageCode}));
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
        languageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
        FocusScope.of(X.Get.context!).requestFocus(new FocusNode());
        final String token = await BaseSharedPreference().getString(SpKeys().apiToken)??"";
        final response = await _dio.put(url, data: data, options: Options(headers: headers??{"Authorization": "Bearer $token","Accept-Language":languageCode}));
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
        languageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
        FocusScope.of(X.Get.context!).requestFocus(new FocusNode());
        final String token = await BaseSharedPreference().getString(SpKeys().apiToken)??"";
        final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
        final response = await _dio.patch(url+((concatUserId??false) ? userId : ""), data: data, options: Options(headers: headers??{"Authorization": "Bearer $token","Accept-Language":languageCode}));
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
        languageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
        final String token = await BaseSharedPreference().getString(SpKeys().apiToken);
        final response = await _dio.delete(url, data: data, options: Options(headers: headers??{"Authorization": "Bearer $token","Accept-Language":languageCode}));
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
        languageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
        final String token = await BaseSharedPreference().getString(SpKeys().apiToken);
        final response = await _dio.delete(url, queryParameters: data, options: Options(headers: headers??{"Authorization": "Bearer $token","Accept-Language":languageCode}));
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

  Future<Response> download(String url, {Map<String, dynamic>? headers, void Function(int, int)? onReceiveProgress}) async {
    // if android sdk greater than 12
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    if (Platform.isIOS) {
      // For iOS devices
      PermissionStatus permission = await Permission.storage.status;
      PermissionStatus permission2 = await Permission.manageExternalStorage.status;

      while (permission != PermissionStatus.granted &&
          permission2 != PermissionStatus.granted) {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.manageExternalStorage,
          Permission.storage,
          // Add more permissions as needed
        ].request();
        permission = statuses[Permission.storage]!;
        permission2 = statuses[Permission.manageExternalStorage]!;
      }
    } else if (Platform.isAndroid && androidInfo.version.sdkInt < 33) {
      // For Android devices with SDK version less than 33
      PermissionStatus permission = await Permission.storage.status;
      PermissionStatus permission2 = await Permission.manageExternalStorage.status;

      while (permission != PermissionStatus.granted &&
          permission2 != PermissionStatus.granted) {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.manageExternalStorage,
          Permission.storage,
          // Add more permissions as needed
        ].request();
        permission = statuses[Permission.storage]!;
        permission2 = statuses[Permission.manageExternalStorage]!;
      }
    }

    try {
      String fileName = url.split('/').last;
      // create a directory in storage
      Directory? directory;
      if (Platform.isAndroid) {
        // Redirects it to download folder in android
        directory = Directory("/storage/emulated/0/Download");
      } else if (Platform.isIOS) {
        // Redirects it to download folder in IOS
        directory = await getDownloadsDirectory();
        directory = Directory(directory?.path.replaceAll('/Downloads', '') ?? '');
      } else {
        directory = await getApplicationDocumentsDirectory();
      }
      int? random = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      String savePath = (directory.path) + '/$random-$fileName';

      log(savePath);
      log('/$random-$fileName');

      int previousProgress = 0;
      bool isFirstProgressEvent = true;

      final response = await _singleton._dio.download(((url).contains("http")) ? (url) :  ApiEndPoints().imageBaseUrl+(url), savePath, options: Options(headers: headers),
          onReceiveProgress: (receivedBytes, totalBytes) {
            if (isFirstProgressEvent) {
              isFirstProgressEvent = false;
              BaseOverlays().showLoader();
            }

            int currentProgress = ((receivedBytes / totalBytes) * 100).toInt();

            if (currentProgress - previousProgress >= 1 || currentProgress < 100) {
              previousProgress = currentProgress;
            }
          });

      BaseOverlays().dismissOverlay();
      showSnackBar(message: 'Download Completed');
      // var res = await OpenFile.open(savePath);
      // print(res);

      return response;
    } on DioError catch (e) {
      showSnackBar(message: e.message.toString());
      _handleError(e);
      throw e.message;
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

  Future<dynamic> postFormDataMedical(String url, Map<String, dynamic> formData, {Map<String, dynamic>? headers, Function(int, int)? onSendProgress}) async {
    try {
      languageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
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

      final response = await _singleton._dio.post(url, data: form, options: Options(headers: headers??{"Authorization": "Bearer $token", "Accept-Language":languageCode}),
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioError catch (e) {
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
        response = await _dio.post(url, data: FormData.fromMap(formData), options: Options(headers: headers ?? {"Authorization": "Bearer $token", "Accept-Language":languageCode}));
      }
      if (type == "patch") {
        response = await _dio.patch(url, data: FormData.fromMap(formData), options: Options(headers: headers ?? {"Authorization": "Bearer $token", "Accept-Language":languageCode}));
      }
      if (type == "put") {
        response = await _dio.put(url, data: FormData.fromMap(formData), options: Options(headers: headers ?? {"Authorization": "Bearer $token", "Accept-Language":languageCode}));
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
