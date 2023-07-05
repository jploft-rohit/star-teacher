class NotificationSettingsResponse {
  dynamic statusCode;
  dynamic message;
  List<NotificationSettingsData>? data;
  Pagination? pagination;

  NotificationSettingsResponse(
      {this.statusCode, this.message, this.data, this.pagination});

  NotificationSettingsResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NotificationSettingsData>[];
      json['data'].forEach((v) {
        data!.add(new NotificationSettingsData.fromJson(v));
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

class NotificationSettingsData {
  dynamic userType;
  dynamic type;
  dynamic sId;
  dynamic title;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  UserNotificationData? userNotificationData;

  NotificationSettingsData(
      {this.userType,
        this.type,
        this.sId,
        this.title,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.userNotificationData});

  NotificationSettingsData.fromJson(Map<String, dynamic> json) {
    userType = json['userType'];
    type = json['type'];
    sId = json['_id'];
    userNotificationData = json['userNotificationData'] != null
        ? new UserNotificationData.fromJson(json['userNotificationData'])
        : null;
    title = json['title'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userType'] = this.userType;
    data['type'] = this.type;
    data['_id'] = this.sId;
    if (this.userNotificationData != null) {
      data['userNotificationData'] = this.userNotificationData!.toJson();
    }
    data['title'] = this.title;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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

class UserNotificationData {
  dynamic type;
  dynamic value;
  dynamic time;
  dynamic isActive;
  dynamic isDeleted;
  dynamic sId;
  dynamic notificationSetting;
  dynamic user;
  dynamic createdAt;
  dynamic createdBy;
  dynamic updatedAt;
  dynamic updatedBy;

  UserNotificationData(
      {this.type,
        this.value,
        this.time,
        this.isActive,
        this.isDeleted,
        this.sId,
        this.notificationSetting,
        this.user,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy});

  UserNotificationData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    time = json['time'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    notificationSetting = json['notificationSetting'];
    user = json['user'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    data['time'] = this.time;
    data['isActive'] = this.isActive;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['notificationSetting'] = this.notificationSetting;
    data['user'] = this.user;
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}