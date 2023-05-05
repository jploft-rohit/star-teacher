class SchoolListResponse {
  Data? data;
  bool? success;
  int? statusCode;
  String? message;

  SchoolListResponse({this.data, this.success, this.statusCode, this.message});

  SchoolListResponse.fromJson(Map<String, dynamic> json) {
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
  List<SchoolData>? data;
  Pagination? pagination;

  Data({this.data, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SchoolData>[];
      json['data'].forEach((v) { data!.add(new SchoolData.fromJson(v)); });
    }
    pagination = json['pagination'] != null ? new Pagination.fromJson(json['pagination']) : null;
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

class SchoolData {
  String? sId;
  String? name;
  SchoolCategory? schoolCategory;
  SchoolSector? schoolSector;
  SchoolSector? schoolArea;
  String? address;
  Language? language;
  String? schoolId;
  int? helplineNo;
  String? email;
  String? secondoryEmail;
  String? website;
  int? mobile;
  Language? schoolType;
  String? user;
  Status? status;
  CreatedBy? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Location? location;
  CreatedBy? updatedBy;
  ParentSchool? parentSchool;

  SchoolData({this.sId, this.name, this.schoolCategory, this.schoolSector, this.schoolArea, this.address, this.language, this.schoolId, this.helplineNo, this.email, this.secondoryEmail, this.website, this.mobile, this.schoolType, this.user, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.location, this.updatedBy, this.parentSchool});

  SchoolData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    schoolCategory = json['schoolCategory'] != null ? new SchoolCategory.fromJson(json['schoolCategory']) : null;
    schoolSector = json['schoolSector'] != null ? new SchoolSector.fromJson(json['schoolSector']) : null;
    schoolArea = json['schoolArea'] != null ? new SchoolSector.fromJson(json['schoolArea']) : null;
    address = json['address'];
    language = json['language'] != null ? new Language.fromJson(json['language']) : null;
    schoolId = json['schoolId'];
    helplineNo = json['helplineNo'];
    email = json['email'];
    secondoryEmail = json['secondoryEmail'];
    website = json['website'];
    mobile = json['mobile'];
    schoolType = json['schoolType'] != null ? new Language.fromJson(json['schoolType']) : null;
    user = json['user'];
    status = json['status'] != null ? new Status.fromJson(json['status']) : null;
    createdBy = json['createdBy'] != null ? new CreatedBy.fromJson(json['createdBy']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    updatedBy = json['updatedBy'] != null ? new CreatedBy.fromJson(json['updatedBy']) : null;
    parentSchool = json['parentSchool'] != null ? new ParentSchool.fromJson(json['parentSchool']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.schoolCategory != null) {
      data['schoolCategory'] = this.schoolCategory!.toJson();
    }
    if (this.schoolSector != null) {
      data['schoolSector'] = this.schoolSector!.toJson();
    }
    if (this.schoolArea != null) {
      data['schoolArea'] = this.schoolArea!.toJson();
    }
    data['address'] = this.address;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    data['schoolId'] = this.schoolId;
    data['helplineNo'] = this.helplineNo;
    data['email'] = this.email;
    data['secondoryEmail'] = this.secondoryEmail;
    data['website'] = this.website;
    data['mobile'] = this.mobile;
    if (this.schoolType != null) {
      data['schoolType'] = this.schoolType!.toJson();
    }
    data['user'] = this.user;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.updatedBy != null) {
      data['updatedBy'] = this.updatedBy!.toJson();
    }
    if (this.parentSchool != null) {
      data['parentSchool'] = this.parentSchool!.toJson();
    }
    return data;
  }
}

class SchoolCategory {
  String? sId;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SchoolCategory({this.sId, this.name, this.status, this.createdAt, this.updatedAt, this.iV});

  SchoolCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class SchoolSector {
  String? sId;
  String? name;
  Location? location;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? updatedBy;

  SchoolSector({this.sId, this.name, this.location, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy});

  SchoolSector.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Language {
  String? sId;
  String? name;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? updatedBy;

  Language({this.sId, this.name, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy});

  Language.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Status {
  String? sId;
  String? name;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Status({this.sId, this.name, this.type, this.createdAt, this.updatedAt, this.iV});

  Status.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class CreatedBy {
  String? sId;
  // Gender? gender;
  bool? isMobileVerified;
  List<String>? idDocument;
  List<String>? parentId;
  String? name;
  String? email;
  String? role;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CreatedBy({this.sId, this.isMobileVerified, this.idDocument, this.parentId, this.name, this.email, this.role, this.password, this.createdAt, this.updatedAt, this.iV});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isMobileVerified = json['isMobileVerified'];
    idDocument = json['idDocument'].cast<String>();
    parentId = json['parentId'].cast<String>();
    name = json['name'];
    email = json['email'];
    role = json['role'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isMobileVerified'] = this.isMobileVerified;
    data['idDocument'] = this.idDocument;
    data['parentId'] = this.parentId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ParentSchool {
  String? sId;
  String? name;
  String? schoolCategory;
  String? schoolSector;
  String? schoolArea;
  String? address;
  String? language;
  String? schoolId;
  int? helplineNo;
  String? email;
  String? secondoryEmail;
  String? website;
  int? mobile;
  String? schoolType;
  Null? user;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Location? location;
  String? updatedBy;

  ParentSchool({this.sId, this.name, this.schoolCategory, this.schoolSector, this.schoolArea, this.address, this.language, this.schoolId, this.helplineNo, this.email, this.secondoryEmail, this.website, this.mobile, this.schoolType, this.user, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.location, this.updatedBy});

  ParentSchool.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    schoolCategory = json['schoolCategory'];
    schoolSector = json['schoolSector'];
    schoolArea = json['schoolArea'];
    address = json['address'];
    language = json['language'];
    schoolId = json['schoolId'];
    helplineNo = json['helplineNo'];
    email = json['email'];
    secondoryEmail = json['secondoryEmail'];
    website = json['website'];
    mobile = json['mobile'];
    schoolType = json['schoolType'];
    user = json['user'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['schoolCategory'] = this.schoolCategory;
    data['schoolSector'] = this.schoolSector;
    data['schoolArea'] = this.schoolArea;
    data['address'] = this.address;
    data['language'] = this.language;
    data['schoolId'] = this.schoolId;
    data['helplineNo'] = this.helplineNo;
    data['email'] = this.email;
    data['secondoryEmail'] = this.secondoryEmail;
    data['website'] = this.website;
    data['mobile'] = this.mobile;
    data['schoolType'] = this.schoolType;
    data['user'] = this.user;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Pagination {
  int? totalCount;
  int? totalPages;
  int? currentPage;
  int? nextPage;
  int? prevPage;

  Pagination({this.totalCount, this.totalPages, this.currentPage, this.nextPage, this.prevPage});

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