class AreaListResponse {
  List<AreaListData>? data;
  Pagination? pagination;
  dynamic success;
  dynamic statusCode;
  dynamic message;

  AreaListResponse(
      {this.data,
        this.pagination,
        this.success,
        this.statusCode,
        this.message});

  AreaListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AreaListData>[];
      json['data'].forEach((v) {
        data!.add(AreaListData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class AreaListData {
  Location? location;
  dynamic address;
  dynamic sId;
  dynamic name;
  Status? status;
  CreatedBy? createdBy;
  dynamic createdAt;
  dynamic updatedAt;

  AreaListData(
      {this.location,
        this.address,
        this.sId,
        this.name,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt});

  AreaListData.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    address = json['address'];
    sId = json['_id'];
    name = json['name'];
    status =
    json['status'] != null ? Status.fromJson(json['status']) : null;
    createdBy = json['createdBy'] != null
        ? CreatedBy.fromJson(json['createdBy'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['address'] = this.address;
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
    return data;
  }
}

class Location {
  dynamic type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Status {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic type;
  dynamic createdAt;
  dynamic updatedAt;

  Status(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.createdAt,
        this.updatedAt});

  Status.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class CreatedBy {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic docDate;
  dynamic deviceType;
  dynamic alternativeMobile;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic isSendActivationRequest;
  dynamic isFirstVerifyActivationRequest;
  dynamic profileCompletePercent;
  dynamic classStatus;
  dynamic attendanceStatus;
  dynamic isReadTermCondtion;
  dynamic isReadResponsibility;
  dynamic isAppAccess;
  dynamic sId;
  dynamic name;
  dynamic email;
  Role? role;
  dynamic password;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic updatedBy;
  dynamic profilePic;
  dynamic uniqueId;

  CreatedBy(
      {this.isMobileVerified,
        this.gender,
        this.docDate,
        this.deviceType,
        this.alternativeMobile,
        this.isDeleted,
        this.currentStatus,
        this.isSendActivationRequest,
        this.isFirstVerifyActivationRequest,
        this.profileCompletePercent,
        this.classStatus,
        this.attendanceStatus,
        this.isReadTermCondtion,
        this.isReadResponsibility,
        this.isAppAccess,
        this.sId,
        this.name,
        this.email,
        this.role,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.updatedBy,
        this.profilePic,
        this.uniqueId});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    docDate = json['docDate'];
    deviceType = json['deviceType'];
    alternativeMobile = json['alternativeMobile'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    isSendActivationRequest = json['isSendActivationRequest'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
    profileCompletePercent = json['profileCompletePercent'];
    classStatus = json['classStatus'];
    attendanceStatus = json['attendanceStatus'];
    isReadTermCondtion = json['isReadTermCondtion'];
    isReadResponsibility = json['isReadResponsibility'];
    isAppAccess = json['isAppAccess'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
    profilePic = json['profilePic'];
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['docDate'] = this.docDate;
    data['deviceType'] = this.deviceType;
    data['alternativeMobile'] = this.alternativeMobile;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isFirstVerifyActivationRequest'] =
        this.isFirstVerifyActivationRequest;
    data['profileCompletePercent'] = this.profileCompletePercent;
    data['classStatus'] = this.classStatus;
    data['attendanceStatus'] = this.attendanceStatus;
    data['isReadTermCondtion'] = this.isReadTermCondtion;
    data['isReadResponsibility'] = this.isReadResponsibility;
    data['isAppAccess'] = this.isAppAccess;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
    data['profilePic'] = this.profilePic;
    data['uniqueId'] = this.uniqueId;
    return data;
  }
}

class Role {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic type;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic displayName;

  Role(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.displayName});

  Role.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    data['nextPage'] = this.nextPage;
    data['prevPage'] = this.prevPage;
    return data;
  }
}
