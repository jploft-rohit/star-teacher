class SubjectResponse {
  Data? data;
  dynamic success;
  dynamic statusCode;
  dynamic message;

  SubjectResponse({this.data, this.success, this.statusCode, this.message});

  SubjectResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<SubjectsData>? data;
  Pagination? pagination;

  Data({this.data, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SubjectsData>[];
      json['data'].forEach((v) {
        data!.add(new SubjectsData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class SubjectsData {
  dynamic sId;
  dynamic name;
  Status? status;
  Status? createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  Status? updatedBy;
  List<Trans>? trans;

  SubjectsData(
      {this.sId,
        this.name,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.updatedBy,
        this.trans});

  SubjectsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    createdBy = json['createdBy'] != null
        ? new Status.fromJson(json['createdBy'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'] != null
        ? new Status.fromJson(json['updatedBy'])
        : null;
    if (json['trans'] != null) {
      trans = <Trans>[];
      json['trans'].forEach((v) {
        trans!.add(new Trans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.updatedBy != null) {
      data['updatedBy'] = this.updatedBy!.toJson();
    }
    if (this.trans != null) {
      data['trans'] = this.trans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  dynamic sId;
  dynamic name;

  Status({this.sId, this.name});

  Status.fromJson(Map<String, dynamic> json) {
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

class Trans {
  dynamic sId;
  dynamic name;
  dynamic language;
  dynamic subject;
  dynamic iV;

  Trans({this.sId, this.name, this.language, this.subject, this.iV});

  Trans.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    language = json['language'];
    subject = json['subject'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['language'] = this.language;
    data['subject'] = this.subject;
    data['__v'] = this.iV;
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