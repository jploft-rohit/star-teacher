class LoginResponse {
  int? statusCode;
  String? message;
  Data? data;

  LoginResponse({this.statusCode, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? otp;
  String? message;

  Data({this.otp, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['message'] = this.message;
    return data;
  }
}