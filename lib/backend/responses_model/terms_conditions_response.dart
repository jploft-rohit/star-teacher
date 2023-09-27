class TermsConditionResponse {
  int? statusCode;
  String? message;
  Data? data;

  TermsConditionResponse({this.statusCode, this.message, this.data});

  TermsConditionResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? isReadCodeOfConduct;
  bool? isReadResponsibility;

  Data({this.isReadCodeOfConduct, this.isReadResponsibility});

  Data.fromJson(Map<String, dynamic> json) {
    isReadCodeOfConduct = json['isReadCodeOfConduct'];
    isReadResponsibility = json['isReadResponsibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isReadCodeOfConduct'] = this.isReadCodeOfConduct;
    data['isReadResponsibility'] = this.isReadResponsibility;
    return data;
  }
}
