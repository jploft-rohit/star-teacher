class ClassScheduleWeeklyPlanResponse {
  List<ClassScheduleWeeklyPlanData>? data;
  dynamic success;
  dynamic statusCode;
  dynamic message;

  ClassScheduleWeeklyPlanResponse({this.data, this.success, this.statusCode, this.message});

  ClassScheduleWeeklyPlanResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ClassScheduleWeeklyPlanData>[];
      json['data'].forEach((v) { data!.add(ClassScheduleWeeklyPlanData.fromJson(v)); });
    }
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class ClassScheduleWeeklyPlanData {
  List<String>? topics;
  dynamic sId;
  bool? isEditing;
  Class? classes;
  Class? section;
  Class? subject;
  dynamic classType;
  dynamic startTime;
  dynamic endTime;
  dynamic day; // int

  ClassScheduleWeeklyPlanData({this.isEditing, this.topics, this.sId, this.classes, this.section, this.subject, this.classType, this.startTime, this.endTime, this.day});

  ClassScheduleWeeklyPlanData.fromJson(Map<String, dynamic> json) {
  topics = json['topics'].cast<String>();
  sId = json['_id'];
  isEditing = json['isEditing'];
  classes = json['class'] != null ? Class.fromJson(json['class']) : null;
  section = json['section'] != null ? Class.fromJson(json['section']) : null;
  subject = json['subject'] != null ? Class.fromJson(json['subject']) : null;
  classType = json['classType'];
  startTime = json['startTime'];
  endTime = json['endTime'];
  day = json['day'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['topics'] = this.topics;
  data['_id'] = this.sId;
  data['isEditing'] = this.isEditing;
  if (this.classes != null) {
  data['class'] = this.classes!.toJson();
  }
  if (this.section != null) {
  data['section'] = this.section!.toJson();
  }
  if (this.subject != null) {
  data['subject'] = this.subject!.toJson();
  }
  data['classType'] = this.classType;
  data['startTime'] = this.startTime;
  data['endTime'] = this.endTime;
  data['day'] = this.day;
  return data;
  }
}

class Class {
  dynamic sId;
  dynamic name;

  Class({this.sId, this.name});

  Class.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class Data {
  List<String>? topics;
  dynamic sId;
  Class? classes;
  Class? section;
  Class? subject;
  dynamic classType;
  dynamic startTime;
  dynamic endTime;
  dynamic day;

  Data({this.topics, this.sId, this.classes, this.section, this.subject, this.classType, this.startTime, this.endTime, this.day});

  Data.fromJson(Map<String, dynamic> json) {
  topics = json['topics'].cast<String>();
  sId = json['_id'];
  classes = json['class'] != null ? Class.fromJson(json['class']) : null;
  section = json['section'] != null ? Class.fromJson(json['section']) : null;
  subject = json['subject'] != null ? Class.fromJson(json['subject']) : null;
  classType = json['classType'];
  startTime = json['startTime'];
  endTime = json['endTime'];
  day = json['day'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['topics'] = this.topics;
  data['_id'] = this.sId;
  if (this.classes != null) {
  data['class'] = this.classes!.toJson();
  }
  if (this.section != null) {
  data['section'] = this.section!.toJson();
  }
  if (this.subject != null) {
  data['subject'] = this.subject!.toJson();
  }
  data['classType'] = this.classType;
  data['startTime'] = this.startTime;
  data['endTime'] = this.endTime;
  data['day'] = this.day;
  return data;
  }
}