class ShopOrderResponse {
  dynamic success;
  dynamic status;
  List<ShopOrderData>? data;
  dynamic message;

  ShopOrderResponse({this.success, this.status, this.data, this.message});

  ShopOrderResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ShopOrderData>[];
      json['data'].forEach((v) {
        data!.add(new ShopOrderData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ShopOrderData {
  dynamic sId;
  dynamic orderId;
  dynamic isPreOrderClosed;
  dynamic orderStatus;
  List<ProgressStatus>? progressStatus;
  dynamic shippingCharges;
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
  dynamic updatedAt;
  dynamic grandTotal;
  dynamic iV;
  dynamic transaction;
  Role? role;
  dynamic prodQuantity;
  dynamic cardStatus;
  dynamic updatedBy;
  dynamic reason;

  ShopOrderData(
      {this.sId,
        this.orderId,
        this.isPreOrderClosed,
        this.orderStatus,
        this.progressStatus,
        this.shippingCharges,
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
        this.updatedAt,
        this.grandTotal,
        this.iV,
        this.transaction,
        this.role,
        this.prodQuantity,
        this.cardStatus,
        this.updatedBy,
        this.reason});

  ShopOrderData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderId = json['orderId'];
    isPreOrderClosed = json['isPreOrderClosed'];
    orderStatus = json['orderStatus'];
    if (json['progressStatus'] != null) {
      progressStatus = <ProgressStatus>[];
      json['progressStatus'].forEach((v) {
        progressStatus!.add(new ProgressStatus.fromJson(v));
      });
    }
    shippingCharges = json['shippingCharges'];
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
    updatedAt = json['updatedAt'];
    grandTotal = json['grandTotal'];
    iV = json['__v'];
    transaction = json['transaction'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    prodQuantity = json['prodQuantity'];
    cardStatus = json['cardStatus'];
    updatedBy = json['updatedBy'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['orderId'] = this.orderId;
    data['isPreOrderClosed'] = this.isPreOrderClosed;
    data['orderStatus'] = this.orderStatus;
    if (this.progressStatus != null) {
      data['progressStatus'] =
          this.progressStatus!.map((v) => v.toJson()).toList();
    }
    data['shippingCharges'] = this.shippingCharges;
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
    data['updatedAt'] = this.updatedAt;
    data['grandTotal'] = this.grandTotal;
    data['__v'] = this.iV;
    data['transaction'] = this.transaction;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['prodQuantity'] = this.prodQuantity;
    data['cardStatus'] = this.cardStatus;
    data['updatedBy'] = this.updatedBy;
    data['reason'] = this.reason;
    return data;
  }
}

class ProgressStatus {
  dynamic sId;
  dynamic isReached;
  dynamic name;
  dynamic filter;
  dynamic updatedAt;

  ProgressStatus(
      {this.sId, this.isReached, this.name, this.filter, this.updatedAt});

  ProgressStatus.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isReached = json['isReached'];
    name = json['name'];
    filter = json['filter'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isReached'] = this.isReached;
    data['name'] = this.name;
    data['filter'] = this.filter;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Role {
  dynamic sId;
  dynamic isDeleted;
  dynamic name;
  dynamic type;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic displayName;
  dynamic filterType;

  Role({this.sId,
        this.isDeleted,
        this.name,
        this.type,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.displayName,
        this.filterType,
      });

  Role.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    displayName = json['displayName'];
    filterType = json['filterType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['type'] = this.type;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['displayName'] = this.displayName;
    data['filterType'] = this.filterType;
    return data;
  }
}
