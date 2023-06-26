class PerformanceResponse {
  dynamic statusCode;
  dynamic message;
  Data? data;
  Pagination? pagination;

  PerformanceResponse({this.statusCode, this.message, this.data, this.pagination});

  PerformanceResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic avgRating;
  List<PerformanceData>? list;

  Data({this.avgRating, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    avgRating = json['avgRating'];
    if (json['list'] != null) {
      list = <PerformanceData>[];
      json['list'].forEach((v) {
        list!.add(new PerformanceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avgRating'] = this.avgRating;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PerformanceData {
  dynamic sId;
  RatedBy? ratedBy;
  dynamic comment;
  dynamic createdAt;
  dynamic isAnonymous;
  dynamic rating;

  PerformanceData(
      {this.sId,
        this.ratedBy,
        this.comment,
        this.createdAt,
        this.isAnonymous,
        this.rating});

  PerformanceData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ratedBy =
    json['ratedBy'] != null ? new RatedBy.fromJson(json['ratedBy']) : null;
    comment = json['comment'];
    createdAt = json['createdAt'];
    isAnonymous = json['isAnonymous'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.ratedBy != null) {
      data['ratedBy'] = this.ratedBy!.toJson();
    }
    data['comment'] = this.comment;
    data['createdAt'] = this.createdAt;
    data['isAnonymous'] = this.isAnonymous;
    data['rating'] = this.rating;
    return data;
  }
}

class RatedBy {
  dynamic sId;
  dynamic name;
  Role? role;

  RatedBy({this.sId, this.name, this.role});

  RatedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    return data;
  }
}

class Role {
  dynamic sId;
  dynamic displayName;

  Role({this.sId, this.displayName});

  Role.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['displayName'] = this.displayName;
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