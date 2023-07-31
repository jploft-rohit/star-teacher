class StarProfile {
  String? sId;
  bool? isMobileVerified;
  String? gender;
  List<String>? idDocument;
  List<String>? parentId;
  bool? isDeleted;
  String? name;
  String? email;
  String? mobile;
  String? landline;
  String? role;
  String? dob;
  String? emirateId;
  String? emirateIdExpire;
  String? createdBy;
  String? updatedBy;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? profilePic;
  String? barcode;
  String? bloodType;
  num? dailyLimit;
  String? otp;
  String? deviceToken;
  String? deviceType;
  String? deviceVoip;
  String? uniqueId;
  Religion? religion;
  Nationality? nationality;
  Student? student;
  Family? family;
  Addresses? addresses;
  NotificationSetting? notificationSetting;
  String? classStatus;
  List<GuardianData>? guardianData;

  StarProfile(
      {this.sId,
      this.isMobileVerified,
      this.gender,
      this.idDocument,
      this.parentId,
      this.isDeleted,
      this.name,
      this.email,
      this.mobile,
      this.landline,
      this.role,
      this.dob,
      this.emirateId,
      this.emirateIdExpire,
      this.createdBy,
      this.updatedBy,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.profilePic,
      this.barcode,
      this.bloodType,
      this.dailyLimit,
      this.otp,
      this.deviceToken,
      this.deviceType,
      this.deviceVoip,
      this.uniqueId,
      this.religion,
      this.nationality,
      this.student,
      this.family,
      this.addresses,
      this.notificationSetting,
      this.classStatus,
      this.guardianData});

  StarProfile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument']?.cast<String>();
    parentId = json['parentId']?.cast<String>();
    isDeleted = json['isDeleted'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    landline = json['landline'];
    role = json['role'];
    dob = json['dob'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    profilePic = json['profilePic'];
    barcode = json['barcode'];
    bloodType = json['bloodType'];
    dailyLimit = json['dailyLimit'];
    otp = json['otp'];
    deviceToken = json['deviceToken'];
    deviceType = json['deviceType'];
    deviceVoip = json['deviceVoip'];
    uniqueId = json['uniqueId'];
    religion =
        json['religion'] != null ? Religion?.fromJson(json['religion']) : null;
    nationality = json['nationality'] != null
        ? Nationality?.fromJson(json['nationality'])
        : null;
    student =
        json['student'] != null ? Student?.fromJson(json['student']) : null;
    family = json['family'] != null ? Family?.fromJson(json['family']) : null;
    addresses = json['addresses'] != null
        ? Addresses?.fromJson(json['addresses'])
        : null;
    notificationSetting = json['notificationSetting'] != null
        ? NotificationSetting?.fromJson(json['notificationSetting'])
        : null;
    classStatus = json['class_status'];
    if (json['guardianData'] != null) {
      guardianData = <GuardianData>[];
      json['guardianData'].forEach((v) {
        guardianData?.add(GuardianData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['isMobileVerified'] = isMobileVerified;
    data['gender'] = gender;
    data['idDocument'] = idDocument;
    data['parentId'] = parentId;
    data['isDeleted'] = isDeleted;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['landline'] = landline;
    data['role'] = role;
    data['dob'] = dob;
    data['emirateId'] = emirateId;
    data['emirateIdExpire'] = emirateIdExpire;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['profilePic'] = profilePic;
    data['barcode'] = barcode;
    data['bloodType'] = bloodType;
    data['dailyLimit'] = dailyLimit;
    data['otp'] = otp;
    data['deviceToken'] = deviceToken;
    data['deviceType'] = deviceType;
    data['deviceVoip'] = deviceVoip;
    data['uniqueId'] = uniqueId;
    if (religion != null) {
      data['religion'] = religion?.toJson();
    }
    if (nationality != null) {
      data['nationality'] = nationality?.toJson();
    }
    if (student != null) {
      data['student'] = student?.toJson();
    }
    if (family != null) {
      data['family'] = family?.toJson();
    }
    if (addresses != null) {
      data['addresses'] = addresses?.toJson();
    }
    if (notificationSetting != null) {
      data['notificationSetting'] = notificationSetting?.toJson();
    }
    data['class_status'] = classStatus;
    if (guardianData != null) {
      data['guardianData'] = guardianData?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Religion {
  String? sId;
  bool? isDeleted;
  String? name;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? updatedBy;

  Religion(
      {this.sId,
      this.isDeleted,
      this.name,
      this.status,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.updatedBy});

  Religion.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['isDeleted'] = isDeleted;
    data['name'] = name;
    data['status'] = status;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['updatedBy'] = updatedBy;
    return data;
  }
}

class Nationality {
  String? sId;
  String? name;
  String? status;
  bool? isDeleted;
  String? updatedAt;
  dynamic updatedBy;

  Nationality(
      {this.sId,
      this.name,
      this.status,
      this.isDeleted,
      this.updatedAt,
      this.updatedBy});

  Nationality.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    status = json['status'];
    isDeleted = json['isDeleted'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['status'] = status;
    data['isDeleted'] = isDeleted;
    data['updatedAt'] = updatedAt;
    data['updatedBy'] = updatedBy;
    return data;
  }
}

class Student {
  String? sId;
  String? language;
  String? user;
  School? school;
  MyClass? myClass;
  String? section;
  String? batch;
  String? studentId;
  bool? isDeleted;
  String? updatedAt;
  String? updatedBy;

  Student(
      {this.sId,
      this.language,
      this.user,
      this.school,
      this.myClass,
      this.section,
      this.batch,
      this.studentId,
      this.isDeleted,
      this.updatedAt,
      this.updatedBy});

  Student.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    language = json['language'];
    user = json['user'];
    school = json['school'] != null ? School?.fromJson(json['school']) : null;
    myClass =
        json['my_class'] != null ? MyClass?.fromJson(json['my_class']) : null;
    section = json['section'];
    batch = json['batch'];
    studentId = json['studentId'];
    isDeleted = json['isDeleted'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['language'] = language;
    data['user'] = user;
    if (school != null) {
      data['school'] = school?.toJson();
    }
    if (myClass != null) {
      data['my_class'] = myClass?.toJson();
    }
    data['section'] = section;
    data['batch'] = batch;
    data['studentId'] = studentId;
    data['isDeleted'] = isDeleted;
    data['updatedAt'] = updatedAt;
    data['updatedBy'] = updatedBy;
    return data;
  }
}

class School {
  String? sId;
  bool? isDeleted;
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
  String? user;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Location? location;
  String? updatedBy;
  double? rating;
  String? brouchure;

  School(
      {this.sId,
      this.isDeleted,
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
      this.user,
      this.status,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.location,
      this.updatedBy,
      this.rating,
      this.brouchure});

  School.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
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
    location =
        json['location'] != null ? Location?.fromJson(json['location']) : null;
    updatedBy = json['updatedBy'];
    rating = json['rating'];
    brouchure = json['brouchure'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['isDeleted'] = isDeleted;
    data['name'] = name;
    data['schoolCategory'] = schoolCategory;
    data['schoolSector'] = schoolSector;
    data['schoolArea'] = schoolArea;
    data['address'] = address;
    data['language'] = language;
    data['schoolId'] = schoolId;
    data['helplineNo'] = helplineNo;
    data['email'] = email;
    data['secondoryEmail'] = secondoryEmail;
    data['website'] = website;
    data['mobile'] = mobile;
    data['schoolType'] = schoolType;
    data['user'] = user;
    data['status'] = status;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (location != null) {
      data['location'] = location?.toJson();
    }
    data['updatedBy'] = updatedBy;
    data['rating'] = rating;
    data['brouchure'] = brouchure;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates']?.cast<double>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class MyClass {
  String? sId;
  bool? isDeleted;
  String? school;
  String? name;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? updatedBy;

  MyClass(
      {this.sId,
      this.isDeleted,
      this.school,
      this.name,
      this.status,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.updatedBy});

  MyClass.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    school = json['school'];
    name = json['name'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['isDeleted'] = isDeleted;
    data['school'] = school;
    data['name'] = name;
    data['status'] = status;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['updatedBy'] = updatedBy;
    return data;
  }
}

class Family {
  String? sId;
  bool? isDeleted;
  List<String>? idDocument;
  String? user;
  String? fullName;
  String? firstName;
  String? relation;
  String? dob;
  String? mobile;
  String? emirateId;
  String? emirateIdExpire;
  String? secondName;
  String? thirdName;
  String? familyName;
  String? gender;
  String? email;
  String? profession;
  String? nationality;
  String? nativeLanguage;
  String? religion;
  String? placeOfBirth;
  String? profilePic;
  String? address;
  String? villaNumber;
  String? locationType;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  dynamic deletedReason;

  Family(
      {this.sId,
      this.isDeleted,
      this.idDocument,
      this.user,
      this.fullName,
      this.firstName,
      this.relation,
      this.dob,
      this.mobile,
      this.emirateId,
      this.emirateIdExpire,
      this.secondName,
      this.thirdName,
      this.familyName,
      this.gender,
      this.email,
      this.profession,
      this.nationality,
      this.nativeLanguage,
      this.religion,
      this.placeOfBirth,
      this.profilePic,
      this.address,
      this.villaNumber,
      this.locationType,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.deletedReason});

  Family.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    idDocument = json['idDocument']?.cast<String>();
    user = json['user'];
    fullName = json['fullName'];
    firstName = json['firstName'];
    relation = json['relation'];
    dob = json['dob'];
    mobile = json['mobile'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    secondName = json['secondName'];
    thirdName = json['thirdName'];
    familyName = json['familyName'];
    gender = json['gender'];
    email = json['email'];
    profession = json['profession'];
    nationality = json['nationality'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    placeOfBirth = json['placeOfBirth'];
    profilePic = json['profilePic'];
    address = json['address'];
    villaNumber = json['villaNumber'];
    locationType = json['locationType'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    deletedReason = json['deletedReason'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['isDeleted'] = isDeleted;
    data['idDocument'] = idDocument;
    data['user'] = user;
    data['fullName'] = fullName;
    data['firstName'] = firstName;
    data['relation'] = relation;
    data['dob'] = dob;
    data['mobile'] = mobile;
    data['emirateId'] = emirateId;
    data['emirateIdExpire'] = emirateIdExpire;
    data['secondName'] = secondName;
    data['thirdName'] = thirdName;
    data['familyName'] = familyName;
    data['gender'] = gender;
    data['email'] = email;
    data['profession'] = profession;
    data['nationality'] = nationality;
    data['nativeLanguage'] = nativeLanguage;
    data['religion'] = religion;
    data['placeOfBirth'] = placeOfBirth;
    data['profilePic'] = profilePic;
    data['address'] = address;
    data['villaNumber'] = villaNumber;
    data['locationType'] = locationType;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['deletedReason'] = deletedReason;
    return data;
  }
}

class Addresses {
  Home? home;
  Home? emergency;

  Addresses({this.home, this.emergency});

  Addresses.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? Home?.fromJson(json['home']) : null;
    emergency =
        json['emergency'] != null ? Home?.fromJson(json['emergency']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (home != null) {
      data['home'] = home?.toJson();
    }
    if (emergency != null) {
      data['emergency'] = emergency?.toJson();
    }
    return data;
  }
}

class Home {
  String? sId;
  Location? location;
  String? locationType;
  String? address;
  bool? isDeleted;
  String? sector;
  String? area;
  String? street;
  String? buildingVilla;
  String? flatVillaNo;
  String? landmark;
  String? mobile;
  String? landline;
  String? user;
  String? document;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Home(
      {this.sId,
      this.location,
      this.locationType,
      this.address,
      this.isDeleted,
      this.sector,
      this.area,
      this.street,
      this.buildingVilla,
      this.flatVillaNo,
      this.landmark,
      this.mobile,
      this.landline,
      this.user,
      this.document,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Home.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    location =
        json['location'] != null ? Location?.fromJson(json['location']) : null;
    locationType = json['locationType'];
    address = json['address'];
    isDeleted = json['isDeleted'];
    sector = json['sector'];
    area = json['area'];
    street = json['street'];
    buildingVilla = json['buildingVilla'];
    flatVillaNo = json['flatVillaNo'];
    landmark = json['landmark'];
    mobile = json['mobile'];
    landline = json['landline'];
    user = json['user'];
    document = json['document'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    if (location != null) {
      data['location'] = location?.toJson();
    }
    data['locationType'] = locationType;
    data['isDeleted'] = isDeleted;
    data['sector'] = sector;
    data['area'] = area;
    data['street'] = street;
    data['buildingVilla'] = buildingVilla;
    data['flatVillaNo'] = flatVillaNo;
    data['landmark'] = landmark;
    data['mobile'] = mobile;
    data['landline'] = landline;
    data['user'] = user;
    data['document'] = document;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class NotificationSetting {
  List<Transport>? transport;

  NotificationSetting({this.transport});

  NotificationSetting.fromJson(Map<String, dynamic> json) {
    if (json['transport'] != null) {
      transport = <Transport>[];
      json['transport'].forEach((v) {
        transport?.add(Transport.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (transport != null) {
      data['transport'] = transport?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transport {
  String? sId;
  String? notificationSetting;
  String? user;
  int? iV;
  String? createdAt;
  String? createdBy;
  bool? isActive;
  bool? isDeleted;
  String? type;
  String? updatedAt;
  String? updatedBy;

  Transport(
      {this.sId,
      this.notificationSetting,
      this.user,
      this.iV,
      this.createdAt,
      this.createdBy,
      this.isActive,
      this.isDeleted,
      this.type,
      this.updatedAt,
      this.updatedBy});

  Transport.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    notificationSetting = json['notificationSetting'];
    user = json['user'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
    type = json['type'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['notificationSetting'] = notificationSetting;
    data['user'] = user;
    data['__v'] = iV;
    data['createdAt'] = createdAt;
    data['createdBy'] = createdBy;
    data['isActive'] = isActive;
    data['isDeleted'] = isDeleted;
    data['type'] = type;
    data['updatedAt'] = updatedAt;
    data['updatedBy'] = updatedBy;
    return data;
  }
}

class GuardianData {
  String? sId;
  String? gender;
  bool? isMobileVerified;
  List<String>? idDocument;
  List<String>? parentId;
  bool? isDeleted;
  String? name;
  String? email;
  String? mobile;
  String? password;
  String? dob;
  Location? location;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? otp;
  String? address;
  String? emirateId;
  String? emirateIdExpire;
  String? deviceToken;
  String? deviceType;
  String? deviceVoip;
  String? role;
  String? nationality;
  dynamic locationType;
  String? status;
  String? profilePic;
  String? barcode;
  num? dailyLimit;
  Family? family;
  bool? isEmailVerified;
  String? country;
  String? sector;
  String? maritalStatus;
  String? alternativeMobile;
  String? state;
  String? nativeLanguage;
  String? religion;
  String? uniqueId;
  String? createdBy;
  String? updatedBy;

  GuardianData(
      {this.sId,
      this.gender,
      this.isMobileVerified,
      this.idDocument,
      this.parentId,
      this.isDeleted,
      this.name,
      this.email,
      this.mobile,
      this.password,
      this.dob,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.otp,
      this.address,
      this.emirateId,
      this.emirateIdExpire,
      this.deviceToken,
      this.deviceType,
      this.deviceVoip,
      this.role,
      this.nationality,
      this.locationType,
      this.status,
      this.profilePic,
      this.barcode,
      this.dailyLimit,
      this.family,
      this.isEmailVerified,
      this.country,
      this.sector,
      this.maritalStatus,
      this.alternativeMobile,
      this.state,
      this.nativeLanguage,
      this.religion,
      this.uniqueId,
      this.createdBy,
      this.updatedBy});

  GuardianData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    gender = json['gender'];
    isMobileVerified = json['isMobileVerified'];
    idDocument = json['idDocument']?.cast<String>();
    parentId = json['parentId']?.cast<String>();
    isDeleted = json['isDeleted'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
    dob = json['dob'];
    location =
        json['location'] != null ? Location?.fromJson(json['location']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    otp = json['otp'];
    address = json['address'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    deviceToken = json['deviceToken'];
    deviceType = json['deviceType'];
    deviceVoip = json['deviceVoip'];
    role = json['role'];
    nationality = json['nationality'];
    locationType = json['locationType'];
    status = json['status'];
    profilePic = json['profilePic'];
    barcode = json['barcode'];
    updatedAt = json['updated_at'];
    dailyLimit = json['dailyLimit'];
    family = json['family'] != null ? Family?.fromJson(json['family']) : null;
    isEmailVerified = json['isEmailVerified'];
    country = json['country'];
    sector = json['sector'];
    maritalStatus = json['maritalStatus'];
    alternativeMobile = json['alternativeMobile'];
    state = json['state'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    uniqueId = json['uniqueId'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['gender'] = gender;
    data['isMobileVerified'] = isMobileVerified;
    data['idDocument'] = idDocument;
    data['parentId'] = parentId;
    data['isDeleted'] = isDeleted;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['password'] = password;
    data['dob'] = dob;
    if (location != null) {
      data['location'] = location?.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['otp'] = otp;
    data['address'] = address;
    data['emirateId'] = emirateId;
    data['emirateIdExpire'] = emirateIdExpire;
    data['deviceToken'] = deviceToken;
    data['deviceType'] = deviceType;
    data['deviceVoip'] = deviceVoip;
    data['role'] = role;
    data['nationality'] = nationality;
    data['locationType'] = locationType;
    data['status'] = status;
    data['profilePic'] = profilePic;
    data['barcode'] = barcode;
    data['updated_at'] = updatedAt;
    data['dailyLimit'] = dailyLimit;
    if (family != null) {
      data['family'] = family?.toJson();
    }
    data['isEmailVerified'] = isEmailVerified;
    data['country'] = country;
    data['sector'] = sector;
    data['maritalStatus'] = maritalStatus;
    data['alternativeMobile'] = alternativeMobile;
    data['state'] = state;
    data['nativeLanguage'] = nativeLanguage;
    data['religion'] = religion;
    data['uniqueId'] = uniqueId;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    return data;
  }
}
