class OtpResponse {
  int? statusCode;
  String? message;
  Data? data;

  OtpResponse({this.statusCode, this.message, this.data});

  OtpResponse.fromJson(Map<String, dynamic> json) {
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
  String? message;
  String? token;
  User? user;

  Data({this.message, this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? gender;
  bool? isDeleted;
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? password;
  String? otp;
  bool? isReadTermCondtion;
  bool? isReadResponsibility;
  String? emirateId;
  String? emirateIdExpire;

  User({this.gender,
        this.isDeleted,
        this.sId,
        this.name,
    this.isReadResponsibility,
    this.isReadTermCondtion,
        this.email,
        this.mobile,
        this.password,
        this.otp,
        this.emirateId,
        this.emirateIdExpire});

  User.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    isReadResponsibility = json['isReadResponsibility'];
    isReadTermCondtion = json['isReadTermCondtion'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
    otp = json['otp'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['isReadResponsibility'] = this.isReadResponsibility;
    data['isReadTermCondtion'] = this.isReadTermCondtion;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['otp'] = this.otp;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    return data;
  }
}