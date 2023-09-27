class TransactionsHistoryResponse {
  dynamic statusCode;
  dynamic message;
  List<TransactionHistoryData>? data;
  Pagination? pagination;

  TransactionsHistoryResponse(
      {this.statusCode, this.message, this.data, this.pagination});

  TransactionsHistoryResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TransactionHistoryData>[];
      json['data'].forEach((v) {
        data!.add(TransactionHistoryData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class TransactionHistoryData {
  dynamic sId;
  dynamic transactionNo;
  dynamic reciept;
  List<String>? productNames;
  List<String>? productImages;
  User? user;
  dynamic wallet;
  User? otherUser;
  dynamic txnId;
  dynamic txnFor;
  dynamic txnType;
  dynamic paymentType;
  dynamic txnMethod;
  dynamic txnAmount;
  dynamic description;
  dynamic title;
  dynamic txnStatus;
  dynamic createdAt;
  Order? order;

  TransactionHistoryData(
      {this.sId,
        this.transactionNo,
        this.reciept,
        this.productNames,
        this.productImages,
        this.user,
        this.wallet,
        this.otherUser,
        this.txnId,
        this.txnFor,
        this.txnType,
        this.paymentType,
        this.txnMethod,
        this.txnAmount,
        this.description,
        this.title,
        this.txnStatus,
        this.createdAt,
        this.order});

  TransactionHistoryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    transactionNo = json['transactionNo'];
    reciept = json['reciept'];
    productNames = json['productNames'].cast<String>();
    productImages = json['productImages'].cast<String>();
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    wallet = json['wallet'];
    otherUser =
    json['otherUser'] != null ? User.fromJson(json['otherUser']) : null;
    txnId = json['txnId'];
    txnFor = json['txnFor'];
    txnType = json['txnType'];
    paymentType = json['paymentType'];
    txnMethod = json['txnMethod'];
    txnAmount = json['txnAmount'];
    description = json['description'];
    title = json['title'];
    txnStatus = json['txnStatus'];
    createdAt = json['createdAt'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['transactionNo'] = this.transactionNo;
    data['reciept'] = this.reciept;
    data['productNames'] = this.productNames;
    data['productImages'] = this.productImages;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['wallet'] = this.wallet;
    if (this.otherUser != null) {
      data['otherUser'] = this.otherUser!.toJson();
    }
    data['txnId'] = this.txnId;
    data['txnFor'] = this.txnFor;
    data['txnType'] = this.txnType;
    data['paymentType'] = this.paymentType;
    data['txnMethod'] = this.txnMethod;
    data['txnAmount'] = this.txnAmount;
    data['description'] = this.description;
    data['title'] = this.title;
    data['txnStatus'] = this.txnStatus;
    data['createdAt'] = this.createdAt;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class User {
  dynamic sId;
  dynamic name;
  dynamic profilePic;
  Role? role;
  dynamic uniqueId;

  User({this.sId, this.name, this.profilePic, this.role, this.uniqueId});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    profilePic = json['profilePic'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['profilePic'] = this.profilePic;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['uniqueId'] = this.uniqueId;
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
  dynamic filterType;
  dynamic displayName;

  Role(
      {this.sId,
        this.isDeleted,
        this.name,
        this.type,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.filterType,
        this.displayName});

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
    filterType = json['filterType'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['type'] = this.type;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['filterType'] = this.filterType;
    data['displayName'] = this.displayName;
    return data;
  }
}

class Order {
  dynamic sId;
  dynamic orderId;
  dynamic shopType;
  dynamic school;
  dynamic transaction;

  Order({this.sId, this.orderId, this.shopType, this.school, this.transaction});

  Order.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderId = json['orderId'];
    shopType = json['shopType'];
    school = json['school'];
    transaction = json['transaction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['orderId'] = this.orderId;
    data['shopType'] = this.shopType;
    data['school'] = this.school;
    data['transaction'] = this.transaction;
    return data;
  }
}

class Pagination {
  dynamic totalCount;
  dynamic totalPages;
  dynamic currentPage;
  dynamic nextPage;
  dynamic prevPage;

  Pagination(
      {this.totalCount,
        this.totalPages,
        this.currentPage,
        this.nextPage,
        this.prevPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    nextPage = json['nextPage'];
    prevPage = json['prevPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    data['nextPage'] = this.nextPage;
    data['prevPage'] = this.prevPage;
    return data;
  }
}
