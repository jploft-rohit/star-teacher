class MyProfileResponse {
  int? statusCode;
  String? message;
  Data? data;

  MyProfileResponse({this.statusCode, this.message, this.data});

  MyProfileResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  bool? isMobileVerified;
  String? gender;
  List<String>? idDocument;
  String? deviceType;
  List<String>? parentId;
  bool? isDeleted;
  String? name;
  String? mobile;
  String? dob;
  String? nationality;
  String? emirateId;
  String? emirateIdExpire;
  dynamic nativeLanguage;
  dynamic religion;
  String? profilePic;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? otp;
  String? deviceToken;
  String? deviceVoip;
  List<SchoolStaff>? schoolStaff;
  List<String>? familyMembers;
  String? alternativeMobile;
  int? profileCompletePercentage;
  String? profileCompleteDate;
  String? barcode;
  SchoolStaff? jobDetails;
  Statistics? statistics;

  Data(
      {this.sId,
      this.isMobileVerified,
      this.gender,
      this.idDocument,
      this.deviceType,
      this.parentId,
      this.isDeleted,
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
      this.iV,
      this.otp,
      this.deviceToken,
      this.deviceVoip,
      this.schoolStaff,
      this.familyMembers,
      this.alternativeMobile,
      this.profileCompletePercentage,
      this.profileCompleteDate,
      this.barcode,
      this.jobDetails,
      this.statistics});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'].cast<String>();
    deviceType = json['deviceType'];
    parentId = json['parentId'].cast<String>();
    isDeleted = json['isDeleted'];
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
    iV = json['__v'];
    otp = json['otp'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    if (json['schoolStaff'] != null) {
      schoolStaff = <SchoolStaff>[];
      json['schoolStaff'].forEach((v) {
        schoolStaff?.add(SchoolStaff.fromJson(v));
      });
    }
    familyMembers = json['familyMembers'].cast<String>();
    alternativeMobile = json['alternativeMobile'];
    profileCompletePercentage = json['profileCompletePercentage'];
    profileCompleteDate = json['profileCompleteDate'];
    barcode = json['barcode'];
    jobDetails = json['jobDetails'] != null
        ? SchoolStaff?.fromJson(json['jobDetails'])
        : null;
    statistics = json['statistics'] != null
        ? Statistics?.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['isMobileVerified'] = isMobileVerified;
    data['gender'] = gender;
    data['idDocument'] = idDocument;
    data['deviceType'] = deviceType;
    data['parentId'] = parentId;
    data['isDeleted'] = isDeleted;
    data['name'] = name;
    data['mobile'] = mobile;
    data['dob'] = dob;
    data['nationality'] = nationality;
    data['emirateId'] = emirateId;
    data['emirateIdExpire'] = emirateIdExpire;
    data['nativeLanguage'] = nativeLanguage;
    data['religion'] = religion;
    data['profilePic'] = profilePic;
    data['role'] = role;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['otp'] = otp;
    data['deviceToken'] = deviceToken;
    data['deviceVoip'] = deviceVoip;
    if (schoolStaff != null) {
      data['schoolStaff'] = schoolStaff?.map((v) => v.toJson()).toList();
    }
    data['familyMembers'] = familyMembers;
    data['alternativeMobile'] = alternativeMobile;
    data['profileCompletePercentage'] = profileCompletePercentage;
    data['profileCompleteDate'] = profileCompleteDate;
    data['barcode'] = barcode;
    if (jobDetails != null) {
      data['jobDetails'] = jobDetails?.toJson();
    }
    if (statistics != null) {
      data['statistics'] = statistics?.toJson();
    }
    return data;
  }
}

class SchoolStaff {
  String? sId;
  bool? isDeleted;
  String? user;
  School? school;
  String? role;
  String? dateOfEmployment;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SchoolStaff(
      {this.sId,
      this.isDeleted,
      this.user,
      this.school,
      this.role,
      this.dateOfEmployment,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SchoolStaff.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    user = json['user'];
    school = json['school'] != null ? School?.fromJson(json['school']) : null;
    role = json['role'];
    dateOfEmployment = json['dateOfEmployment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['isDeleted'] = isDeleted;
    data['user'] = user;
    if (school != null) {
      data['school'] = school?.toJson();
    }
    data['role'] = role;
    data['dateOfEmployment'] = dateOfEmployment;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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
  String? status;
  int? helplineNo;
  String? email;
  String? secondoryEmail;
  String? website;
  int? mobile;
  dynamic parentSchool;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? updatedBy;
  Staffsubjects? staffsubjects;
  Location? location;

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
      this.status,
      this.helplineNo,
      this.email,
      this.secondoryEmail,
      this.website,
      this.mobile,
      this.parentSchool,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.updatedBy,
      this.staffsubjects,
      this.location});

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
    status = json['status'];
    helplineNo = json['helplineNo'];
    email = json['email'];
    secondoryEmail = json['secondoryEmail'];
    website = json['website'];
    mobile = json['mobile'];
    parentSchool = json['parentSchool'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
    staffsubjects = json['staffsubjects'] != null
        ? Staffsubjects?.fromJson(json['staffsubjects'])
        : null;
    location =
        json['location'] != null ? Location?.fromJson(json['location']) : null;
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
    data['status'] = status;
    data['helplineNo'] = helplineNo;
    data['email'] = email;
    data['secondoryEmail'] = secondoryEmail;
    data['website'] = website;
    data['mobile'] = mobile;
    data['parentSchool'] = parentSchool;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['updatedBy'] = updatedBy;
    if (staffsubjects != null) {
      data['staffsubjects'] = staffsubjects?.toJson();
    }
    if (location != null) {
      data['location'] = location?.toJson();
    }
    return data;
  }
}

class Staffsubjects {
  String? sId;
  String? school;
  String? schoolStaff;
  List<MyClass>? myClass;
  List<ClassSection>? classSection;
  Subject? subject;

  Staffsubjects(
      {this.sId,
      this.school,
      this.schoolStaff,
      this.myClass,
      this.classSection,
      this.subject});

  Staffsubjects.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    school = json['school'];
    schoolStaff = json['schoolStaff'];
    if (json['my_class'] != null) {
      myClass = <MyClass>[];
      json['my_class'].forEach((v) {
        myClass?.add(MyClass.fromJson(v));
      });
    }
    if (json['classSection'] != null) {
      classSection = <ClassSection>[];
      json['classSection'].forEach((v) {
        classSection?.add(ClassSection.fromJson(v));
      });
    }
    subject =
        json['subject'] != null ? Subject?.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['school'] = school;
    data['schoolStaff'] = schoolStaff;
    if (myClass != null) {
      data['my_class'] = myClass?.map((v) => v.toJson()).toList();
    }
    if (classSection != null) {
      data['classSection'] = classSection?.map((v) => v.toJson()).toList();
    }
    if (subject != null) {
      data['subject'] = subject?.toJson();
    }
    return data;
  }
}

class MyClass {
  String? sId;
  String? school;
  String? name;

  MyClass({this.sId, this.school, this.name});

  MyClass.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    school = json['school'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['school'] = school;
    data['name'] = name;
    return data;
  }
}

class ClassSection {
  String? sId;
  String? school;
  String? myClass;
  String? name;
  String? roomNo;
  String? status;

  ClassSection(
      {this.sId,
      this.school,
      this.myClass,
      this.name,
      this.roomNo,
      this.status});

  ClassSection.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    school = json['school'];
    myClass = json['my_class'];
    name = json['name'];
    roomNo = json['roomNo'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['school'] = school;
    data['my_class'] = myClass;
    data['name'] = name;
    data['roomNo'] = roomNo;
    data['status'] = status;
    return data;
  }
}

class Subject {
  String? sId;
  String? language;
  String? name;
  String? status;

  Subject({this.sId, this.language, this.name, this.status});

  Subject.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    language = json['language'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['language'] = language;
    data['name'] = name;
    data['status'] = status;
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
    final data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class Statistics {
  String? pendingTask;
  String? unclosedComplaint;
  String? starsEvaluationPending;
  String? assignmentToReview;
  String? attendanceRecord;
  String? performance;
  String? linkedStars;
  String? allocatedSchools;
  String? totalClassesAttendedThisWeek;
  String? avgOfInteractingWithChatting;

  Statistics(
      {this.pendingTask,
      this.unclosedComplaint,
      this.starsEvaluationPending,
      this.assignmentToReview,
      this.attendanceRecord,
      this.performance,
      this.linkedStars,
      this.allocatedSchools,
      this.totalClassesAttendedThisWeek,
      this.avgOfInteractingWithChatting});

  Statistics.fromJson(Map<String, dynamic> json) {
    pendingTask = json['pendingTask'];
    unclosedComplaint = json['unclosedComplaint'];
    starsEvaluationPending = json['starsEvaluationPending'];
    assignmentToReview = json['assignmentToReview'];
    attendanceRecord = json['attendanceRecord'];
    performance = json['performance'];
    linkedStars = json['linkedStars'];
    allocatedSchools = json['allocatedSchools'];
    totalClassesAttendedThisWeek = json['totalClassesAttendedThisWeek'];
    avgOfInteractingWithChatting = json['avgOfInteractingWithChatting'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['pendingTask'] = pendingTask;
    data['unclosedComplaint'] = unclosedComplaint;
    data['starsEvaluationPending'] = starsEvaluationPending;
    data['assignmentToReview'] = assignmentToReview;
    data['attendanceRecord'] = attendanceRecord;
    data['performance'] = performance;
    data['linkedStars'] = linkedStars;
    data['allocatedSchools'] = allocatedSchools;
    data['totalClassesAttendedThisWeek'] = totalClassesAttendedThisWeek;
    data['avgOfInteractingWithChatting'] = avgOfInteractingWithChatting;
    return data;
  }
}
