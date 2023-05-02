import 'package:get/get.dart';

import '../models/my_profile_response_model.dart';

class MyProfileResponseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return MyProfileResponse.fromJson(map);
      if (map is List)
        return map.map((item) => MyProfileResponse.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<MyProfileResponse?> getMyProfileResponse(int id) async {
    final response = await get('myprofileresponse/$id');
    return response.body;
  }

  Future<Response<MyProfileResponse>> postMyProfileResponse(
          MyProfileResponse myprofileresponse) async =>
      await post('myprofileresponse', myprofileresponse);
  Future<Response> deleteMyProfileResponse(int id) async =>
      await delete('myprofileresponse/$id');
}
