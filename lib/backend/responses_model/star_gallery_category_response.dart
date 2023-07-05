class GalleryCategoryResponse {
  dynamic statusCode;
  dynamic message;
  List<StarGalleryCategoryData>? data;

  GalleryCategoryResponse({this.statusCode, this.message, this.data});

  GalleryCategoryResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StarGalleryCategoryData>[];
      json['data'].forEach((v) {
        data!.add(new StarGalleryCategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StarGalleryCategoryData {
  dynamic isDeleted;
  dynamic sId;
  dynamic title;
  dynamic status;

  StarGalleryCategoryData({this.isDeleted, this.sId, this.title, this.status});

  StarGalleryCategoryData.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['status'] = this.status;
    return data;
  }
}