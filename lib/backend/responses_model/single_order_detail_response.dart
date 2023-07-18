class SingleOrderDetailResponse {
  dynamic success;
  dynamic status;
  SingleOrderProductData? data;
  dynamic message;

  SingleOrderDetailResponse(
      {this.success, this.status, this.data, this.message});

  SingleOrderDetailResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    data = json['data'] != null ? new SingleOrderProductData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class SingleOrderProductData {
  dynamic orderId;
  dynamic isPreOrderClosed;
  dynamic cardStatus;
  dynamic reason;
  dynamic shippingCharges;
  dynamic sId;
  dynamic orderStatus;
  List<ProgressStatus>? progressStatus;
  User? user;
  dynamic shopType;
  dynamic totalAmount;
  dynamic taxAmount;
  dynamic address;
  dynamic paymentMode;
  dynamic shippingType;
  dynamic school;
  dynamic servingPlace;
  dynamic deliveryDay;
  dynamic deliveryBreakTime;
  dynamic startDate;
  dynamic endDate;
  dynamic orderType;
  dynamic createdAt;
  dynamic grandTotal;
  dynamic iV;
  dynamic transaction;
  List<SingleOrderProduct>? products;

  SingleOrderProductData(
      {this.orderId,
        this.isPreOrderClosed,
        this.cardStatus,
        this.reason,
        this.shippingCharges,
        this.sId,
        this.orderStatus,
        this.progressStatus,
        this.user,
        this.shopType,
        this.totalAmount,
        this.taxAmount,
        this.address,
        this.paymentMode,
        this.shippingType,
        this.school,
        this.servingPlace,
        this.deliveryDay,
        this.deliveryBreakTime,
        this.startDate,
        this.endDate,
        this.orderType,
        this.createdAt,
        this.grandTotal,
        this.iV,
        this.transaction,
        this.products});

  SingleOrderProductData.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    isPreOrderClosed = json['isPreOrderClosed'];
    cardStatus = json['cardStatus'];
    reason = json['reason'];
    shippingCharges = json['shippingCharges'];
    sId = json['_id'];
    orderStatus = json['orderStatus'];
    if (json['progressStatus'] != null) {
      progressStatus = <ProgressStatus>[];
      json['progressStatus'].forEach((v) {
        progressStatus!.add(new ProgressStatus.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    shopType = json['shopType'];
    totalAmount = json['totalAmount'];
    taxAmount = json['taxAmount'];
    address = json['address'];
    paymentMode = json['paymentMode'];
    shippingType = json['shippingType'];
    school = json['school'];
    servingPlace = json['servingPlace'];
    deliveryDay = json['deliveryDay'];
    deliveryBreakTime = json['deliveryBreakTime'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    orderType = json['orderType'];
    createdAt = json['createdAt'];
    grandTotal = json['grandTotal'];
    iV = json['__v'];
    transaction = json['transaction'];
    if (json['products'] != null) {
      products = <SingleOrderProduct>[];
      json['products'].forEach((v) {
        products!.add(new SingleOrderProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['isPreOrderClosed'] = this.isPreOrderClosed;
    data['cardStatus'] = this.cardStatus;
    data['reason'] = this.reason;
    data['shippingCharges'] = this.shippingCharges;
    data['_id'] = this.sId;
    data['orderStatus'] = this.orderStatus;
    if (this.progressStatus != null) {
      data['progressStatus'] =
          this.progressStatus!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['shopType'] = this.shopType;
    data['totalAmount'] = this.totalAmount;
    data['taxAmount'] = this.taxAmount;
    data['address'] = this.address;
    data['paymentMode'] = this.paymentMode;
    data['shippingType'] = this.shippingType;
    data['school'] = this.school;
    data['servingPlace'] = this.servingPlace;
    data['deliveryDay'] = this.deliveryDay;
    data['deliveryBreakTime'] = this.deliveryBreakTime;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['orderType'] = this.orderType;
    data['createdAt'] = this.createdAt;
    data['grandTotal'] = this.grandTotal;
    data['__v'] = this.iV;
    data['transaction'] = this.transaction;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProgressStatus {
  dynamic status;
  dynamic timestamp;

  ProgressStatus({this.status, this.timestamp});

  ProgressStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class User {
  dynamic sId;
  dynamic name;

  User({this.sId, this.name});

  User.fromJson(Map<String, dynamic> json) {
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

class SingleOrderProduct {
  dynamic sId;
  ProductId? productId;
  dynamic pricePerQty;
  dynamic totalQty;
  dynamic productTotalAmount;

  SingleOrderProduct(
      {this.sId,
        this.productId,
        this.pricePerQty,
        this.totalQty,
        this.productTotalAmount});

  SingleOrderProduct.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productId = json['productId'] != null
        ? new ProductId.fromJson(json['productId'])
        : null;
    pricePerQty = json['pricePerQty'];
    totalQty = json['totalQty'];
    productTotalAmount = json['productTotalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.productId != null) {
      data['productId'] = this.productId!.toJson();
    }
    data['pricePerQty'] = this.pricePerQty;
    data['totalQty'] = this.totalQty;
    data['productTotalAmount'] = this.productTotalAmount;
    return data;
  }
}

class ProductId {
  List<String>? images;
  dynamic sId;
  dynamic name;
  dynamic price;

  ProductId({this.images, this.sId, this.name, this.price});

  ProductId.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}