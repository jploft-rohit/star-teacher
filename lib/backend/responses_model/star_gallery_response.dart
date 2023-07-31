class StarGalleryResponse {
  dynamic statusCode;
  dynamic message;
  List<StarGalleryData>? data;
  Pagination? pagination;

  StarGalleryResponse({this.statusCode, this.message, this.data, this.pagination});

  StarGalleryResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StarGalleryData>[];
      json['data'].forEach((v) { data!.add(new StarGalleryData.fromJson(v)); });
    }
    pagination = json['pagination'] != null ? new Pagination.fromJson(json['pagination']) : null;
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

class StarGalleryData {
  List<Uploads>? uploads;
  dynamic isDeleted;
  dynamic sId;
  User? user;
  GalleryCategory? galleryCategory;
  Class? classes;
  Section? section;
  dynamic title;
  Status? status;
  User? uploadedBy;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;

  StarGalleryData({this.uploads, this.isDeleted, this.sId, this.user, this.galleryCategory, this.classes, this.section, this.title, this.status, this.uploadedBy, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt});

  StarGalleryData.fromJson(Map<String, dynamic> json) {
    if (json['uploads'] != null) {
      uploads = <Uploads>[];
      json['uploads'].forEach((v) { uploads!.add(new Uploads.fromJson(v)); });
    }
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    galleryCategory = json['galleryCategory'] != null ? new GalleryCategory.fromJson(json['galleryCategory']) : null;
    classes = json['class'] != null ? new Class.fromJson(json['class']) : null;
    section = json['section'] != null ? new Section.fromJson(json['section']) : null;
    title = json['title'];
    status = json['status'] != null ? new Status.fromJson(json['status']) : null;
    uploadedBy = json['uploadedBy'] != null ? new User.fromJson(json['uploadedBy']) : null;
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uploads != null) {
      data['uploads'] = this.uploads!.map((v) => v.toJson()).toList();
    }
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.galleryCategory != null) {
      data['galleryCategory'] = this.galleryCategory!.toJson();
    }
    if (this.classes != null) {
      data['class'] = this.classes!.toJson();
    }
    if (this.section != null) {
      data['section'] = this.section!.toJson();
    }
    data['title'] = this.title;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.uploadedBy != null) {
      data['uploadedBy'] = this.uploadedBy!.toJson();
    }
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Uploads {
  dynamic type;
  dynamic extension;
  dynamic url;
  dynamic thumbnail;

  Uploads({this.type, this.extension, this.url,this.thumbnail});

  Uploads.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    extension = json['extension'];
    url = json['url'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['extension'] = this.extension;
    data['url'] = this.url;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class User {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic mobile;
  dynamic dob;
  dynamic nationality;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic nativeLanguage;
  dynamic religion;
  dynamic profilePic;
  dynamic role;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic otp;
  dynamic deviceToken;
  dynamic deviceVoip;
  dynamic address;
  dynamic country;
  dynamic email;
  dynamic status;
  dynamic state;

  User({this.isMobileVerified, this.gender, this.idDocument, this.deviceType, this.parentId, this.isDeleted, this.sId, this.name, this.mobile, this.dob, this.nationality, this.emirateId, this.emirateIdExpire, this.nativeLanguage, this.religion, this.profilePic, this.role, this.createdAt, this.updatedAt, this.otp, this.deviceToken, this.deviceVoip, this.address, this.country, this.email, this.status, this.state});

  User.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    deviceType = json['deviceType'];
    parentId = json['parentId'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    mobile = json['mobile'];
    dob = json['dob'];
    nationality = json['nationality'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    profilePic = json['profilePic'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    otp = json['otp'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    address = json['address'];
    country = json['country'];
    email = json['email'];
    status = json['status'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['deviceType'] = this.deviceType;
    if (this.parentId != null) {
      data['parentId'] = this.parentId!.map((v) => v.toJson()).toList();
    }
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['nationality'] = this.nationality;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['nativeLanguage'] = this.nativeLanguage;
    data['religion'] = this.religion;
    data['profilePic'] = this.profilePic;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['otp'] = this.otp;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
    data['address'] = this.address;
    data['country'] = this.country;
    data['email'] = this.email;
    data['status'] = this.status;
    data['state'] = this.state;
    return data;
  }
}

class GalleryCategory {
  dynamic isDeleted;
  dynamic sId;
  dynamic title;
  dynamic status;

  GalleryCategory({this.isDeleted, this.sId, this.title, this.status});

  GalleryCategory.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['status'] = this.status;
    return data;
  }
}

class Class {
  dynamic isDeleted;
  dynamic sId;
  dynamic school;
  dynamic name;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic updatedBy;

  Class({this.isDeleted, this.sId, this.school, this.name, this.status, this.createdBy, this.createdAt, this.updatedAt, this.updatedBy});

  Class.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'];
    name = json['name'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['school'] = this.school;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Section {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic classes;
  dynamic school;
  dynamic roomNo;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic updatedBy;

  Section({this.isDeleted, this.sId, this.name, this.classes, this.school, this.roomNo, this.status, this.createdBy, this.createdAt, this.updatedAt, this.updatedBy});

  Section.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    classes = json['class'];
    school = json['school'];
    roomNo = json['roomNo'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['class'] = this.classes;
    data['school'] = this.school;
    data['roomNo'] = this.roomNo;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
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

  Status({this.isDeleted, this.sId, this.name, this.type, this.createdAt, this.updatedAt});

  Status.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
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