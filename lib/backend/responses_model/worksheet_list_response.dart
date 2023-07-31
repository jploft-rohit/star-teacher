

import 'dart:convert';

WorksheetListResponse worksheetListResponseFromJson(String str) => WorksheetListResponse.fromJson(json.decode(str));

String worksheetListResponseToJson(WorksheetListResponse data) => json.encode(data.toJson());

class WorksheetListResponse {
  int? statusCode;
  String? message;
  List<Datum>? data;
  Pagination? pagination;

  WorksheetListResponse({
    this.statusCode,
    this.message,
    this.data,
    this.pagination,
  });

  factory WorksheetListResponse.fromJson(Map<String, dynamic> json) => WorksheetListResponse(
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Datum {
  String? description;
  bool? isDeleted;
  String? id;
  School? school;
  String? assignmentNo;
  String? type;
  AssignTo? assignTo;
  String? postDate;
  String? postTime;
  String? submitDate;
  String? submitTime;
  String? dueDate;
  String? link;
  String? title;
  String? assignment;
  String? supportDoc;
  User? user;
  String? status;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalMarks;
  int? totalQuestions;

  Datum({
    this.description,
    this.isDeleted,
    this.id,
    this.school,
    this.assignmentNo,
    this.type,
    this.assignTo,
    this.postDate,
    this.postTime,
    this.submitDate,
    this.submitTime,
    this.dueDate,
    this.link,
    this.title,
    this.assignment,
    this.supportDoc,
    this.user,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalMarks,
    this.totalQuestions,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    description: json["description"],
    isDeleted: json["isDeleted"],
    id: json["_id"],
    school: json["school"] == null ? null : School.fromJson(json["school"]),
    assignmentNo: json["assignmentNo"],
    type: json["type"],
    assignTo: json["assignTo"] == null ? null : AssignTo.fromJson(json["assignTo"]),
    postDate: json["postDate"],
    postTime: json["postTime"],
    submitDate: json["submitDate"],
    submitTime: json["submitTime"],
    dueDate: json["dueDate"],
    link: json["link"],
    title: json["title"],
    assignment: json["assignment"],
    supportDoc: json["supportDoc"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    status: json["status"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    totalMarks: json["totalMarks"],
    totalQuestions: json["totalQuestions"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "isDeleted": isDeleted,
    "_id": id,
    "school": school?.toJson(),
    "assignmentNo": assignmentNo,
    "type": type,
    "assignTo": assignTo?.toJson(),
    "postDate": postDate,
    "postTime": postTime,
    "submitDate": submitDate,
    "submitTime": submitTime,
    "dueDate": dueDate,
    "link": link,
    "title": title,
    "assignment": assignment,
    "supportDoc": supportDoc,
    "user": user?.toJson(),
    "status": status,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "totalMarks": totalMarks,
    "totalQuestions": totalQuestions,
  };
}

class AssignTo {
  bool? isMobileVerified;
  String? gender;
  List<String>? idDocument;
  String? deviceType;
  List<dynamic>? parentId;
  bool? isDeleted;
  String? currentStatus;
  String? isSendActivationRequest;
  String? isFirstVerifyActivationRequest;
  String? id;
  String? name;
  String? mobile;
  String? dob;
  String? nationality;
  String? emirateId;
  String? emirateIdExpire;
  String? nativeLanguage;
  String? religion;
  String? profilePic;
  Role? role;
  String? createdAt;
  String? updatedAt;
  String? otp;
  String? deviceToken;
  String? deviceVoip;
  String? address;
  String? country;
  String? email;
  String? status;
  String? state;
  String? alternativeMobile;
  String? sector;
  String? maritalStatus;
  String? barcode;
  String? uniqueId;

  AssignTo({
    this.isMobileVerified,
    this.gender,
    this.idDocument,
    this.deviceType,
    this.parentId,
    this.isDeleted,
    this.currentStatus,
    this.isSendActivationRequest,
    this.isFirstVerifyActivationRequest,
    this.id,
    this.name,
    this.mobile,
    this.dob,
    this.nationality,
    this.emirateId,
    this.emirateIdExpire,
    this.nativeLanguage,
    this.religion,
    this.profilePic,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.otp,
    this.deviceToken,
    this.deviceVoip,
    this.address,
    this.country,
    this.email,
    this.status,
    this.state,
    this.alternativeMobile,
    this.sector,
    this.maritalStatus,
    this.barcode,
    this.uniqueId,
  });

  factory AssignTo.fromJson(Map<String, dynamic> json) => AssignTo(
    isMobileVerified: json["isMobileVerified"],
    gender: json["gender"],
    idDocument: json["idDocument"] == null ? [] : List<String>.from(json["idDocument"]!.map((x) => x)),
    deviceType: json["deviceType"],
    parentId: json["parentId"] == null ? [] : List<dynamic>.from(json["parentId"]!.map((x) => x)),
    isDeleted: json["isDeleted"],
    currentStatus: json["currentStatus"],
    isSendActivationRequest: json["isSendActivationRequest"],
    isFirstVerifyActivationRequest: json["isFirstVerifyActivationRequest"],
    id: json["_id"],
    name: json["name"],
    mobile: json["mobile"],
    dob: json["dob"],
    nationality: json["nationality"],
    emirateId: json["emirateId"],
    emirateIdExpire: json["emirateIdExpire"],
    nativeLanguage: json["nativeLanguage"],
    religion: json["religion"],
    profilePic: json["profilePic"],
    role: json["role"] == null ? null : Role.fromJson(json["role"]),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    otp: json["otp"],
    deviceToken: json["deviceToken"],
    deviceVoip: json["deviceVoip"],
    address: json["address"],
    country: json["country"],
    email: json["email"],
    status: json["status"],
    state: json["state"],
    alternativeMobile: json["alternativeMobile"],
    sector: json["sector"],
    maritalStatus: json["maritalStatus"],
    barcode: json["barcode"],
    uniqueId: json["uniqueId"],
  );

  Map<String, dynamic> toJson() => {
    "isMobileVerified": isMobileVerified,
    "gender": gender,
    "idDocument": idDocument == null ? [] : List<dynamic>.from(idDocument!.map((x) => x)),
    "deviceType": deviceType,
    "parentId": parentId == null ? [] : List<dynamic>.from(parentId!.map((x) => x)),
    "isDeleted": isDeleted,
    "currentStatus": currentStatus,
    "isSendActivationRequest": isSendActivationRequest,
    "isFirstVerifyActivationRequest": isFirstVerifyActivationRequest,
    "_id": id,
    "name": name,
    "mobile": mobile,
    "dob": dob,
    "nationality": nationality,
    "emirateId": emirateId,
    "emirateIdExpire": emirateIdExpire,
    "nativeLanguage": nativeLanguage,
    "religion": religion,
    "profilePic": profilePic,
    "role": role?.toJson(),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "otp": otp,
    "deviceToken": deviceToken,
    "deviceVoip": deviceVoip,
    "address": address,
    "country": country,
    "email": email,
    "status": status,
    "state": state,
    "alternativeMobile": alternativeMobile,
    "sector": sector,
    "maritalStatus": maritalStatus,
    "barcode": barcode,
    "uniqueId": uniqueId,
  };
}

class Role {
  bool? isDeleted;
  String? id;
  String? name;
  String? type;
  String? status;
  dynamic createdBy;
  String? createdAt;
  String? updatedAt;
  String? filterType;
  String? displayName;

  Role({
    this.isDeleted,
    this.id,
    this.name,
    this.type,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.filterType,
    this.displayName,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    isDeleted: json["isDeleted"],
    id: json["_id"],
    name: json["name"],
    type: json["type"],
    status: json["status"],
    createdBy: json["createdBy"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    filterType: json["filterType"],
    displayName: json["displayName"],
  );

  Map<String, dynamic> toJson() => {
    "isDeleted": isDeleted,
    "_id": id,
    "name": name,
    "type": type,
    "status": status,
    "createdBy": createdBy,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "filterType": filterType,
    "displayName": displayName,
  };
}

class School {
  String? brouchure;
  bool? isDeleted;
  String? id;
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
  String? mobile;
  String? schoolType;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  School({
    this.brouchure,
    this.isDeleted,
    this.id,
    this.name,
    this.schoolCategory,
    this.schoolSector,
    this.schoolArea,
    this.address,
    this.language,
    this.schoolId,
    this.helplineNo,
    this.email,
    this.secondoryEmail,
    this.website,
    this.mobile,
    this.schoolType,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory School.fromJson(Map<String, dynamic> json) => School(
    brouchure: json["brouchure"],
    isDeleted: json["isDeleted"],
    id: json["_id"],
    name: json["name"],
    schoolCategory: json["schoolCategory"],
    schoolSector: json["schoolSector"],
    schoolArea: json["schoolArea"],
    address: json["address"],
    language: json["language"],
    schoolId: json["schoolId"],
    helplineNo: json["helplineNo"],
    email: json["email"],
    secondoryEmail: json["secondoryEmail"],
    website: json["website"],
    mobile: json["mobile"],
    schoolType: json["schoolType"],
    status: json["status"],
    createdBy: json["createdBy"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "brouchure": brouchure,
    "isDeleted": isDeleted,
    "_id": id,
    "name": name,
    "schoolCategory": schoolCategory,
    "schoolSector": schoolSector,
    "schoolArea": schoolArea,
    "address": address,
    "language": language,
    "schoolId": schoolId,
    "helplineNo": helplineNo,
    "email": email,
    "secondoryEmail": secondoryEmail,
    "website": website,
    "mobile": mobile,
    "schoolType": schoolType,
    "status": status,
    "createdBy": createdBy,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

class User {
  bool? isMobileVerified;
  String? gender;
  List<String>? idDocument;
  String? deviceType;
  List<dynamic>? parentId;
  bool? isDeleted;
  String? currentStatus;
  String? isSendActivationRequest;
  String? isFirstVerifyActivationRequest;
  String? id;
  String? name;
  String? mobile;
  String? dob;
  String? nationality;
  String? emirateId;
  String? emirateIdExpire;
  String? nativeLanguage;
  String? religion;
  String? profilePic;
  Role? role;
  String? createdAt;
  String? updatedAt;
  String? otp;
  String? deviceToken;
  String? deviceVoip;
  String? address;
  String? country;
  String? email;
  String? status;
  String? state;
  String? alternativeMobile;
  String? sector;
  String? maritalStatus;
  String? uniqueId;
  Location? location;
  String? locationType;
  String? slotNo;

  User({
    this.isMobileVerified,
    this.gender,
    this.idDocument,
    this.deviceType,
    this.parentId,
    this.isDeleted,
    this.currentStatus,
    this.isSendActivationRequest,
    this.isFirstVerifyActivationRequest,
    this.id,
    this.name,
    this.mobile,
    this.dob,
    this.nationality,
    this.emirateId,
    this.emirateIdExpire,
    this.nativeLanguage,
    this.religion,
    this.profilePic,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.otp,
    this.deviceToken,
    this.deviceVoip,
    this.address,
    this.country,
    this.email,
    this.status,
    this.state,
    this.alternativeMobile,
    this.sector,
    this.maritalStatus,
    this.uniqueId,
    this.location,
    this.locationType,
    this.slotNo,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    isMobileVerified: json["isMobileVerified"],
    gender: json["gender"],
    idDocument: json["idDocument"] == null ? [] : List<String>.from(json["idDocument"]!.map((x) => x)),
    deviceType: json["deviceType"],
    parentId: json["parentId"] == null ? [] : List<dynamic>.from(json["parentId"]!.map((x) => x)),
    isDeleted: json["isDeleted"],
    currentStatus: json["currentStatus"],
    isSendActivationRequest: json["isSendActivationRequest"],
    isFirstVerifyActivationRequest: json["isFirstVerifyActivationRequest"],
    id: json["_id"],
    name: json["name"],
    mobile: json["mobile"],
    dob: json["dob"],
    nationality: json["nationality"],
    emirateId: json["emirateId"],
    emirateIdExpire: json["emirateIdExpire"],
    nativeLanguage: json["nativeLanguage"],
    religion: json["religion"],
    profilePic: json["profilePic"],
    role: json["role"] == null ? null : Role.fromJson(json["role"]),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    otp: json["otp"],
    deviceToken: json["deviceToken"],
    deviceVoip: json["deviceVoip"],
    address: json["address"],
    country: json["country"],
    email: json["email"],
    status: json["status"],
    state: json["state"],
    alternativeMobile: json["alternativeMobile"],
    sector: json["sector"],
    maritalStatus: json["maritalStatus"],
    uniqueId: json["uniqueId"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    locationType: json["locationType"],
    slotNo: json["slotNo"],
  );

  Map<String, dynamic> toJson() => {
    "isMobileVerified": isMobileVerified,
    "gender": gender,
    "idDocument": idDocument == null ? [] : List<dynamic>.from(idDocument!.map((x) => x)),
    "deviceType": deviceType,
    "parentId": parentId == null ? [] : List<dynamic>.from(parentId!.map((x) => x)),
    "isDeleted": isDeleted,
    "currentStatus": currentStatus,
    "isSendActivationRequest": isSendActivationRequest,
    "isFirstVerifyActivationRequest": isFirstVerifyActivationRequest,
    "_id": id,
    "name": name,
    "mobile": mobile,
    "dob": dob,
    "nationality": nationality,
    "emirateId": emirateId,
    "emirateIdExpire": emirateIdExpire,
    "nativeLanguage": nativeLanguage,
    "religion": religion,
    "profilePic": profilePic,
    "role": role?.toJson(),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "otp": otp,
    "deviceToken": deviceToken,
    "deviceVoip": deviceVoip,
    "address": address,
    "country": country,
    "email": email,
    "status": status,
    "state": state,
    "alternativeMobile": alternativeMobile,
    "sector": sector,
    "maritalStatus": maritalStatus,
    "uniqueId": uniqueId,
    "location": location?.toJson(),
    "locationType": locationType,
    "slotNo": slotNo,
  };
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({
    this.type,
    this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}

class Pagination {
  int? totalCount;
  int? totalPages;
  int? currentPage;
  dynamic nextPage;
  dynamic prevPage;

  Pagination({
    this.totalCount,
    this.totalPages,
    this.currentPage,
    this.nextPage,
    this.prevPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalCount: json["totalCount"],
    totalPages: json["totalPages"],
    currentPage: json["currentPage"],
    nextPage: json["nextPage"],
    prevPage: json["prevPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "totalPages": totalPages,
    "currentPage": currentPage,
    "nextPage": nextPage,
    "prevPage": prevPage,
  };
}
