class MedicalRecord {
  String? sId;
  String? title;
  String? description;
  String? rejectedReason;
  String? comment;
  String? date;
  dynamic student;
  String? document;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  List<RequestStatus>? requestStatus;

  MedicalRecord(
      {this.sId,
      this.title,
      this.rejectedReason,
      this.description,
      this.date,
      this.comment,
      this.student,
      this.document,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.requestStatus,
      this.updatedAt});

  MedicalRecord.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    rejectedReason = json['rejectedReason'];
    comment = json['comment'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
    if (json['requestStatus'] != null) {
      requestStatus = <RequestStatus>[];
      json['requestStatus'].forEach((v) {
        requestStatus!.add(new RequestStatus.fromJson(v));
      });
    }
    student = json['student'];
    document = json['document'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['comment'] = comment;
    if (this.requestStatus != null) {
      data['requestStatus'] =
          this.requestStatus!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['rejectedReason'] = rejectedReason;
    data['description'] = description;
    data['date'] = date;
    data['student'] = student;
    data['document'] = document;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class RequestStatus {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic type;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic order;
  dynamic date;

  RequestStatus(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.order,
        this.date});

  RequestStatus.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    order = json['order'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['order'] = this.order;
    data['date'] = this.date;
    return data;
  }
}

class User {
  bool? isMobileVerified;
  String? gender;
  List<String>? idDocument;
  String? deviceType;
  List<String>? parentId;
  bool? isDeleted;
  String? sId;
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

  User(
      {this.isMobileVerified,
      this.gender,
      this.idDocument,
      this.deviceType,
      this.parentId,
      this.isDeleted,
      this.sId,
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
      this.uniqueId});

  User.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'].cast<String>();
    deviceType = json['deviceType'];
    parentId = json['parentId'].cast<String>();
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
    role = json['role'] != null ? Role?.fromJson(json['role']) : null;
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
    alternativeMobile = json['alternativeMobile'];
    sector = json['sector'];
    maritalStatus = json['maritalStatus'];
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isMobileVerified'] = isMobileVerified;
    data['gender'] = gender;
    data['idDocument'] = idDocument;
    data['deviceType'] = deviceType;
    data['parentId'] = parentId;
    data['isDeleted'] = isDeleted;
    data['_id'] = sId;
    data['name'] = name;
    data['mobile'] = mobile;
    data['dob'] = dob;
    data['nationality'] = nationality;
    data['emirateId'] = emirateId;
    data['emirateIdExpire'] = emirateIdExpire;
    data['nativeLanguage'] = nativeLanguage;
    data['religion'] = religion;
    data['profilePic'] = profilePic;
    if (role != null) {
      data['role'] = role?.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['otp'] = otp;
    data['deviceToken'] = deviceToken;
    data['deviceVoip'] = deviceVoip;
    data['address'] = address;
    data['country'] = country;
    data['email'] = email;
    data['status'] = status;
    data['state'] = state;
    data['alternativeMobile'] = alternativeMobile;
    data['sector'] = sector;
    data['maritalStatus'] = maritalStatus;
    data['uniqueId'] = uniqueId;
    return data;
  }
}

class Role {
  bool? isDeleted;
  String? sId;
  String? name;
  String? type;
  String? status;
  dynamic createdBy;
  String? createdAt;
  String? updatedAt;
  String? filterType;
  String? displayName;

  Role(
      {this.isDeleted,
      this.sId,
      this.name,
      this.type,
      this.status,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.filterType,
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
    filterType = json['filterType'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isDeleted'] = isDeleted;
    data['_id'] = sId;
    data['name'] = name;
    data['type'] = type;
    data['status'] = status;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['filterType'] = filterType;
    data['displayName'] = displayName;
    return data;
  }
}
