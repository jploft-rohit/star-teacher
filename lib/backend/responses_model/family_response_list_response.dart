class FamilyRelationListResponse {
  dynamic statusCode;
  dynamic message;
  List<FamilyRelationData>? data;

  FamilyRelationListResponse({this.statusCode, this.message, this.data});

  FamilyRelationListResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FamilyRelationData>[];
      json['data'].forEach((v) {
        data!.add(FamilyRelationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FamilyRelationData {
  dynamic sId;
  dynamic name;

  FamilyRelationData({this.sId, this.name});

  FamilyRelationData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}