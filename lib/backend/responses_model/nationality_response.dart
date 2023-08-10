class NationalityResponse {
  List<NationalityData>? data;
  dynamic success;
  dynamic statusCode;
  dynamic message;

  NationalityResponse(
      {this.data,
        this.success,
        this.statusCode,
        this.message});

  NationalityResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NationalityData>[];
      json['data'].forEach((v) {
        data!.add(new NationalityData.fromJson(v));
      });
    }
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class NationalityData {
  dynamic sId;
  dynamic name;

  NationalityData(
      {this.sId,
        this.name,
      });

  NationalityData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}