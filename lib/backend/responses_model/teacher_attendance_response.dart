class TeacherAttendanceResponse {
  dynamic statusCode;
  dynamic message;
  Data? data;

  TeacherAttendanceResponse({this.statusCode, this.message, this.data});

  TeacherAttendanceResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  TeacherData? user;
  List<TeacherAttendanceData>? attendanceData;

  Data({this.user, this.attendanceData});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new TeacherData.fromJson(json['user']) : null;
    if (json['attendanceData'] != null) {
      attendanceData = <TeacherAttendanceData>[];
      json['attendanceData'].forEach((v) {
        attendanceData!.add(new TeacherAttendanceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.attendanceData != null) {
      data['attendanceData'] =
          this.attendanceData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeacherData {
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
  dynamic alternativeMobile;
  dynamic sector;
  dynamic maritalStatus;
  dynamic uniqueId;

  TeacherData(
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

  TeacherData.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    parentId = json['parentId'];
    deviceType = json['deviceType'];
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
    alternativeMobile = json['alternativeMobile'];
    sector = json['sector'];
    maritalStatus = json['maritalStatus'];
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['parentId'] = this.parentId;
    data['deviceType'] = this.deviceType;
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
    data['alternativeMobile'] = this.alternativeMobile;
    data['sector'] = this.sector;
    data['maritalStatus'] = this.maritalStatus;
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
  dynamic filterType;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['filterType'] = this.filterType;
    data['displayName'] = this.displayName;
    return data;
  }
}

class TeacherAttendanceData {
  dynamic sId;
  dynamic present;
  dynamic isDeleted;
  School? school;
  SchoolStaff? schoolStaff;
  dynamic date;
  dynamic time;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic attendanceType;
  dynamic document;
  dynamic reason;
  dynamic type;
  TeacherData? user;
  List<Userleaves>? userleaves;

  TeacherAttendanceData(
      {this.sId,
        this.present,
        this.isDeleted,
        this.school,
        this.schoolStaff,
        this.date,
        this.time,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.attendanceType,
        this.document,
        this.reason,
        this.type,
        this.user,
        this.userleaves});

  TeacherAttendanceData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    present = json['present'];
    isDeleted = json['isDeleted'];
    school =
    json['school'] != null ? new School.fromJson(json['school']) : null;
    schoolStaff = json['schoolStaff'] != null
        ? new SchoolStaff.fromJson(json['schoolStaff'])
        : null;
    date = json['date'];
    time = json['time'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    attendanceType = json['attendanceType'];
    document = json['document'];
    reason = json['reason'];
    type = json['type'];
    user = json['user'] != null ? new TeacherData.fromJson(json['user']) : null;
    if (json['userleaves'] != null) {
      userleaves = <Userleaves>[];
      json['userleaves'].forEach((v) {
        userleaves!.add(new Userleaves.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['present'] = this.present;
    data['isDeleted'] = this.isDeleted;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    if (this.schoolStaff != null) {
      data['schoolStaff'] = this.schoolStaff!.toJson();
    }
    data['date'] = this.date;
    data['time'] = this.time;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['attendanceType'] = this.attendanceType;
    data['document'] = this.document;
    data['reason'] = this.reason;
    data['type'] = this.type;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.userleaves != null) {
      data['userleaves'] = this.userleaves!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class School {
  dynamic sId;
  dynamic isDeleted;
  dynamic name;
  dynamic schoolCategory;
  dynamic schoolSector;
  dynamic schoolArea;
  dynamic address;
  dynamic language;
  dynamic schoolId;
  dynamic helplineNo;
  dynamic email;
  dynamic secondoryEmail;
  dynamic website;
  dynamic mobile;
  dynamic schoolType;
  dynamic user;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  Location? location;
  dynamic updatedBy;
  dynamic rating;
  dynamic brouchure;

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
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    updatedBy = json['updatedBy'];
    rating = json['rating'];
    brouchure = json['brouchure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
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
    data['rating'] = this.rating;
    data['brouchure'] = this.brouchure;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class SchoolStaff {
  dynamic sId;
  dynamic isDeleted;
  TeacherData? user;
  dynamic school;
  dynamic role;
  dynamic dateOfEmployment;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic designation;
  dynamic classPerWeek;
  dynamic employeeId;
  dynamic employmentCertificate;
  dynamic jobCertificate;
  dynamic jobGrade;
  dynamic jobTitle;
  dynamic salaryCertificate;
  dynamic slotNumber;
  dynamic slotType;
  dynamic studentGender;
  dynamic titleGrade;
  dynamic weekDays;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  SchoolStaff(
      {this.sId,
        this.isDeleted,
        this.user,
        this.school,
        this.role,
        this.dateOfEmployment,
        this.createdBy,
        this.updatedBy,
        this.designation,
        this.classPerWeek,
        this.employeeId,
        this.employmentCertificate,
        this.jobCertificate,
        this.jobGrade,
        this.jobTitle,
        this.salaryCertificate,
        this.slotNumber,
        this.slotType,
        this.studentGender,
        this.titleGrade,
        this.weekDays,
        this.createdAt,
        this.updatedAt,
        this.iV});

  SchoolStaff.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    user = json['user'] != null ? new TeacherData.fromJson(json['user']) : null;
    school = json['school'];
    role = json['role'];
    dateOfEmployment = json['dateOfEmployment'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    designation = json['designation'];
    classPerWeek = json['classPerWeek'];
    employeeId = json['employeeId'];
    employmentCertificate = json['employmentCertificate'];
    jobCertificate = json['jobCertificate'];
    jobGrade = json['jobGrade'];
    jobTitle = json['jobTitle'];
    salaryCertificate = json['salaryCertificate'];
    slotNumber = json['slotNumber'];
    slotType = json['slotType'];
    studentGender = json['studentGender'];
    titleGrade = json['titleGrade'];
    weekDays = json['weekDays'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['school'] = this.school;
    data['role'] = this.role;
    data['dateOfEmployment'] = this.dateOfEmployment;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['designation'] = this.designation;
    data['classPerWeek'] = this.classPerWeek;
    data['employeeId'] = this.employeeId;
    data['employmentCertificate'] = this.employmentCertificate;
    data['jobCertificate'] = this.jobCertificate;
    data['jobGrade'] = this.jobGrade;
    data['jobTitle'] = this.jobTitle;
    data['salaryCertificate'] = this.salaryCertificate;
    data['slotNumber'] = this.slotNumber;
    data['slotType'] = this.slotType;
    data['studentGender'] = this.studentGender;
    data['titleGrade'] = this.titleGrade;
    data['weekDays'] = this.weekDays;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Userleaves {
  dynamic sId;
  dynamic user;
  LeaveType? leaveType;
  dynamic allocated;
  dynamic remaining;
  dynamic isDeleted;

  Userleaves(
      {this.sId,
        this.user,
        this.leaveType,
        this.allocated,
        this.remaining,
        this.isDeleted});

  Userleaves.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    leaveType = json['leaveType'] != null
        ? new LeaveType.fromJson(json['leaveType'])
        : null;
    allocated = json['allocated'];
    remaining = json['remaining'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.leaveType != null) {
      data['leaveType'] = this.leaveType!.toJson();
    }
    data['allocated'] = this.allocated;
    data['remaining'] = this.remaining;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}

class LeaveType {
  dynamic sId;
  dynamic language;
  dynamic name;
  dynamic isDeleted;
  dynamic description;

  LeaveType(
      {this.sId, this.language, this.name, this.isDeleted, this.description});

  LeaveType.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    language = json['language'];
    name = json['name'];
    isDeleted = json['isDeleted'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['language'] = this.language;
    data['name'] = this.name;
    data['isDeleted'] = this.isDeleted;
    data['description'] = this.description;
    return data;
  }
}
