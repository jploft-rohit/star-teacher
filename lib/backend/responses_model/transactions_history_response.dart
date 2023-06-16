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
        data!.add(new TransactionHistoryData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  dynamic isDeleted;
  dynamic sId;
  dynamic user;
  dynamic wallet;
  dynamic txnId;
  dynamic txnFor;
  dynamic txnType;
  dynamic txnMethod;
  dynamic txnAmount;
  dynamic description;
  dynamic title;
  dynamic txnStatus;
  dynamic txnDueDate;
  dynamic paymentSlot;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  String? paymentType;
  String? productImage;

  TransactionHistoryData(
      {this.isDeleted,
        this.sId,
        this.user,
        this.wallet,
        this.txnId,
        this.txnFor,
        this.txnType,
        this.txnMethod,
        this.txnAmount,
        this.description,
        this.title,
        this.paymentType,
        this.txnStatus,
        this.txnDueDate,
        this.paymentSlot,
        this.createdBy,
        this.updatedBy,
        this.productImage,
        this.createdAt,
        this.updatedAt});

  TransactionHistoryData.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    user = json['user'];
    wallet = json['wallet'];
    txnId = json['txnId'];
    txnFor = json['txnFor'];
    txnType = json['txnType'];
    txnMethod = json['txnMethod'];
    txnAmount = json['txnAmount'];
    description = json['description'];
    title = json['title'];
    productImage = json['productImage'];
    paymentType = json['paymentType'];
    txnStatus = json['txnStatus'];
    txnDueDate = json['txnDueDate'];
    paymentSlot = json['paymentSlot'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['paymentType'] = this.paymentType;
    data['wallet'] = this.wallet;
    data['txnId'] = this.txnId;
    data['txnFor'] = this.txnFor;
    data['txnType'] = this.txnType;
    data['txnMethod'] = this.txnMethod;
    data['productImage'] = this.productImage;
    data['txnAmount'] = this.txnAmount;
    data['description'] = this.description;
    data['title'] = this.title;
    data['txnStatus'] = this.txnStatus;
    data['txnDueDate'] = this.txnDueDate;
    data['paymentSlot'] = this.paymentSlot;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    data['nextPage'] = this.nextPage;
    data['prevPage'] = this.prevPage;
    return data;
  }
}