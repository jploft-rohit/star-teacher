class ShopCategoryListResponse {
  List<ShopCategoryListData>? data;
  dynamic success;
  dynamic statusCode;
  dynamic message;

  ShopCategoryListResponse(
      {this.data, this.success, this.statusCode, this.message});

  ShopCategoryListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ShopCategoryListData>[];
      json['data'].forEach((v) {
        data!.add(new ShopCategoryListData.fromJson(v));
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

class ShopCategoryListData {
  dynamic title;
  dynamic sId;
  dynamic shopType;

  ShopCategoryListData({this.title, this.sId, this.shopType});

  ShopCategoryListData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    sId = json['_id'];
    shopType = json['shopType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['_id'] = this.sId;
    data['shopType'] = this.shopType;
    return data;
  }
}