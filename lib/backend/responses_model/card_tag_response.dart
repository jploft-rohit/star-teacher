class CardTagResponse {
  dynamic statusCode;
  dynamic message;
  Data? data;

  CardTagResponse({this.statusCode, this.message, this.data});

  CardTagResponse.fromJson(Map<String, dynamic> json) {
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
  List<Orders>? orders;
  List<UserTags>? userTags;

  Data({this.orders, this.userTags});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    if (json['userTags'] != null) {
      userTags = <UserTags>[];
      json['userTags'].forEach((v) {
        userTags!.add(new UserTags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.userTags != null) {
      data['userTags'] = this.userTags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  dynamic sId;
  dynamic orderId;
  dynamic isPreOrderClosed;
  dynamic orderStatus;
  List<ProgressStatus>? progressStatus;
  dynamic shippingCharges;
  dynamic isDeleted;
  dynamic user;
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
  dynamic reason;
  dynamic rejectedReason;
  List<RequestStatus>? requestStatus;
  UserTags? userTags;

  Orders(
      {this.sId,
        this.rejectedReason,
        this.orderId,
        this.isPreOrderClosed,
        this.orderStatus,
        this.progressStatus,
        this.shippingCharges,
        this.isDeleted,
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
        this.updatedAt,
        this.grandTotal,
        this.iV,
        this.transaction,
        this.reason,
        this.requestStatus,
        this.userTags});

  Orders.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    rejectedReason = json['rejectedReason'];
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
    isDeleted = json['isDeleted'];
    user = json['user'];
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
    reason = json['reason'];
    if (json['requestStatus'] != null) {
      requestStatus = <RequestStatus>[];
      json['requestStatus'].forEach((v) {
        requestStatus!.add(new RequestStatus.fromJson(v));
      });
    }
    userTags = json['userTags'] != null
        ? new UserTags.fromJson(json['userTags'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['rejectedReason'] = this.rejectedReason;
    data['orderId'] = this.orderId;
    data['isPreOrderClosed'] = this.isPreOrderClosed;
    data['orderStatus'] = this.orderStatus;
    if (this.progressStatus != null) {
      data['progressStatus'] =
          this.progressStatus!.map((v) => v.toJson()).toList();
    }
    data['shippingCharges'] = this.shippingCharges;
    data['isDeleted'] = this.isDeleted;
    data['user'] = this.user;
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
    data['reason'] = this.reason;
    if (this.requestStatus != null) {
      data['requestStatus'] =
          this.requestStatus!.map((v) => v.toJson()).toList();
    }
    if (this.userTags != null) {
      data['userTags'] = this.userTags!.toJson();
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

class RequestStatus {
  dynamic sId;
  dynamic starRequest;
  dynamic requestManagement;
  dynamic vehicleMaintenance;
  dynamic roleDelegation;
  dynamic order;
  dynamic isDeleted;
  dynamic type;
  dynamic name;
  dynamic statusTitle;
  dynamic createdBy;
  dynamic status;
  dynamic date;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  RequestStatus(
      {this.sId,
        this.starRequest,
        this.requestManagement,
        this.vehicleMaintenance,
        this.roleDelegation,
        this.order,
        this.name,
        this.isDeleted,
        this.type,
        this.statusTitle,
        this.createdBy,
        this.status,
        this.date,
        this.createdAt,
        this.updatedAt,
        this.iV});

  RequestStatus.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    starRequest = json['starRequest'];
    requestManagement = json['requestManagement'];
    vehicleMaintenance = json['vehicleMaintenance'];
    roleDelegation = json['roleDelegation'];
    order = json['order'];
    name = json['name'];
    isDeleted = json['isDeleted'];
    type = json['type'];
    statusTitle = json['statusTitle'];
    createdBy = json['createdBy'];
    status = json['status'];
    date = json['date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['starRequest'] = this.starRequest;
    data['name'] = this.name;
    data['requestManagement'] = this.requestManagement;
    data['vehicleMaintenance'] = this.vehicleMaintenance;
    data['roleDelegation'] = this.roleDelegation;
    data['order'] = this.order;
    data['isDeleted'] = this.isDeleted;
    data['type'] = this.type;
    data['statusTitle'] = this.statusTitle;
    data['createdBy'] = this.createdBy;
    data['status'] = this.status;
    data['date'] = this.date;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class UserTags {
  dynamic sId;
  dynamic status;
  dynamic isDeleted;
  dynamic user;
  dynamic school;
  dynamic order;
  dynamic product;
  dynamic tagNo;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  UserTags(
      {this.sId,
        this.status,
        this.isDeleted,
        this.user,
        this.school,
        this.order,
        this.product,
        this.tagNo,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UserTags.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    isDeleted = json['isDeleted'];
    user = json['user'];
    school = json['school'];
    order = json['order'];
    product = json['product'];
    tagNo = json['tagNo'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['status'] = this.status;
    data['isDeleted'] = this.isDeleted;
    data['user'] = this.user;
    data['school'] = this.school;
    data['order'] = this.order;
    data['product'] = this.product;
    data['tagNo'] = this.tagNo;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}