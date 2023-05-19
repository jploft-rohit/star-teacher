class BaseSuccessResponse {
  dynamic statusCode;
  dynamic message;
  dynamic data;

  BaseSuccessResponse({this.statusCode, this.message, this.data});

  BaseSuccessResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}