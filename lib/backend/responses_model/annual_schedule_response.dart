class AnnualScheduleResponse {
  dynamic statusCode;
  dynamic message;
  List<AnnualScheduleData>? data;
  Pagination? pagination;

  AnnualScheduleResponse(
      {this.statusCode, this.message, this.data, this.pagination});

  AnnualScheduleResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AnnualScheduleData>[];
      json['data'].forEach((v) {
        data!.add(new AnnualScheduleData.fromJson(v));
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

class AnnualScheduleData {
  dynamic forUser;
  dynamic type;
  dynamic sId;
  dynamic school;
  dynamic title;
  dynamic startDate;
  dynamic endDate;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic color;
  dynamic icon;

  AnnualScheduleData({
        this.forUser,
        this.type,
        this.sId,
        this.school,
        this.title,
        this.startDate,
        this.endDate,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.color,
        this.icon,
  });

  AnnualScheduleData.fromJson(Map<String, dynamic> json) {
    forUser = json['forUser'];
    type = json['type'];
    sId = json['_id'];
    school = json['school'];
    title = json['title'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    color = json['color'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forUser'] = this.forUser;
    data['type'] = this.type;
    data['_id'] = this.sId;
    data['school'] = this.school;
    data['title'] = this.title;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['color'] = this.color;
    data['icon'] = this.icon;
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