class ShopProductsResponse {
  dynamic status;
  dynamic success;
  List<ShopProductData>? data;
  dynamic message;

  ShopProductsResponse({this.status, this.success, this.data, this.message});

  ShopProductsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = <ShopProductData>[];
      json['data'].forEach((v) {
        data!.add(new ShopProductData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ShopProductData {
  dynamic sId;
  List<String>? images;
  List<String>? size;
  List<Allergies>? allergies;
  dynamic currentStatus;
  dynamic isAvailable;
  dynamic isDeleted;
  dynamic user;
  dynamic category;
  dynamic shopType;
  dynamic name;
  dynamic price;
  dynamic description;
  dynamic uploadSizeChart;
  dynamic quantity; // int
  dynamic notifyStockLeft;
  dynamic createdBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic school;
  dynamic updatedBy;

  ShopProductData(
      { this.sId,
        this.images,
        this.size,
        this.allergies,
        this.currentStatus,
        this.isAvailable,
        this.isDeleted,
        this.user,
        this.category,
        this.shopType,
        this.name,
        this.price,
        this.description,
        this.uploadSizeChart,
        this.quantity,
        this.notifyStockLeft,
        this.createdBy,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.school,
        this.updatedBy});

  ShopProductData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    images = json['images'].cast<String>();
    size = json['size'].cast<String>();
    if (json['allergies'] != null) {
      allergies = <Allergies>[];
      json['allergies'].forEach((v) {
        allergies!.add(new Allergies.fromJson(v));
      });
    }
    currentStatus = json['currentStatus'];
    isAvailable = json['isAvailable'];
    isDeleted = json['isDeleted'];
    user = json['user'];
    category = json['category'];
    shopType = json['shopType'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    uploadSizeChart = json['uploadSizeChart'];
    quantity = json['quantity'];
    notifyStockLeft = json['notifyStockLeft'];
    createdBy = json['createdBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    school = json['school'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['images'] = this.images;
    data['size'] = this.size;
    if (this.allergies != null) {
      data['allergies'] = this.allergies!.map((v) => v.toJson()).toList();
    }
    data['currentStatus'] = this.currentStatus;
    data['isAvailable'] = this.isAvailable;
    data['isDeleted'] = this.isDeleted;
    data['user'] = this.user;
    data['category'] = this.category;
    data['shopType'] = this.shopType;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['uploadSizeChart'] = this.uploadSizeChart;
    data['quantity'] = this.quantity;
    data['notifyStockLeft'] = this.notifyStockLeft;
    data['createdBy'] = this.createdBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['school'] = this.school;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Allergies {
  dynamic sId;
  dynamic name;

  Allergies({this.sId, this.name});

  Allergies.fromJson(Map<String, dynamic> json) {
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