class UserCartResponse {
  dynamic statusCode; // Int
  dynamic message;
  UserCartData? data;

  UserCartResponse({this.statusCode, this.message, this.data});

  UserCartResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new UserCartData.fromJson(json['data']) : null;
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

class UserCartData {
  dynamic sId;
  dynamic user;
  dynamic totalAmount;
  dynamic taxAmount;
  dynamic tax; // Int
  List<CartProductsData>? items;
  dynamic grandTotal;

  UserCartData(
      {this.sId,
        this.user,
        this.totalAmount,
        this.taxAmount,
        this.tax,
        this.items,
        this.grandTotal});

  UserCartData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    totalAmount = json['totalAmount'];
    taxAmount = json['taxAmount'];
    tax = json['tax'];
    if (json['items'] != null) {
      items = <CartProductsData>[];
      json['items'].forEach((v) {
        items!.add(new CartProductsData.fromJson(v));
      });
    }
    grandTotal = json['grandTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['totalAmount'] = this.totalAmount;
    data['taxAmount'] = this.taxAmount;
    data['tax'] = this.tax;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['grandTotal'] = this.grandTotal;
    return data;
  }
}

class CartProductsData {
  dynamic quantity; // Int
  List<String>? images;
  dynamic sId;
  dynamic category;
  dynamic shopType;
  dynamic name;
  dynamic price;
  dynamic description;
  dynamic product;

  CartProductsData(
      {this.quantity,
        this.images,
        this.sId,
        this.category,
        this.shopType,
        this.name,
        this.price,
        this.description,
        this.product});

  CartProductsData.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    images = json['images'].cast<String>();
    sId = json['_id'];
    category = json['category'];
    shopType = json['shopType'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['images'] = this.images;
    data['_id'] = this.sId;
    data['category'] = this.category;
    data['shopType'] = this.shopType;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['product'] = this.product;
    return data;
  }
}