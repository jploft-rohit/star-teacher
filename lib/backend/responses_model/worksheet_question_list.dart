import 'dart:convert';

WorksheetQuestionList worksheetQuestionListFromJson(String str) => WorksheetQuestionList.fromJson(json.decode(str));

String worksheetQuestionListToJson(WorksheetQuestionList data) => json.encode(data.toJson());

class WorksheetQuestionList {
  int? statusCode;
  String? message;
  WorksheetQuestionData? data;
  Pagination? pagination;

  WorksheetQuestionList({
    this.statusCode,
    this.message,
    this.data,
    this.pagination,
  });

  factory WorksheetQuestionList.fromJson(Map<String, dynamic> json) => WorksheetQuestionList(
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? null : WorksheetQuestionData.fromJson(json["data"]),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
    "pagination": pagination?.toJson(),
  };
}

class WorksheetQuestionData {
  String? id;
  bool? isDeleted;
  String? school;
  String? assignmentNo;
  String? type;
  String? assignTo;
  String? postDate;
  String? postTime;
  String? submitDate;
  String? submitTime;
  String? dueDate;
  String? link;
  String? assignment;
  String? supportDoc;
  String? user;
  String? status;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  List<Question>? questions;

  WorksheetQuestionData({
    this.id,
    this.isDeleted,
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
    this.assignment,
    this.supportDoc,
    this.user,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.questions,
  });

  factory WorksheetQuestionData.fromJson(Map<String, dynamic> json) => WorksheetQuestionData(
    id: json["_id"],
    isDeleted: json["isDeleted"],
    school: json["school"],
    assignmentNo: json["assignmentNo"],
    type: json["type"],
    assignTo: json["assignTo"],
    postDate: json["postDate"],
    postTime: json["postTime"],
    submitDate: json["submitDate"],
    submitTime: json["submitTime"],
    dueDate: json["dueDate"],
    link: json["link"],
    assignment: json["assignment"],
    supportDoc: json["supportDoc"],
    user: json["user"],
    status: json["status"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "isDeleted": isDeleted,
    "school": school,
    "assignmentNo": assignmentNo,
    "type": type,
    "assignTo": assignTo,
    "postDate": postDate,
    "postTime": postTime,
    "submitDate": submitDate,
    "submitTime": submitTime,
    "dueDate": dueDate,
    "link": link,
    "assignment": assignment,
    "supportDoc": supportDoc,
    "user": user,
    "status": status,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x.toJson())),
  };
}

class Question {
  String? id;
  Option? option1;
  Option? option2;
  Option? option3;
  Option? option4;
  Option? option5;
  Option? option6;
  Answer? answer;
  bool? isDeleted;
  String? assignment;
  String? type;
  String? subtype;
  int? marks;
  String? title;
  String? mediaFile;
  String? description;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? questionNo;

  Question({
    this.id,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.option5,
    this.option6,
    this.answer,
    this.isDeleted,
    this.assignment,
    this.type,
    this.subtype,
    this.marks,
    this.title,
    this.mediaFile,
    this.description,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.questionNo,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["_id"],
    option1: json["option1"] == null ? null : Option.fromJson(json["option1"]),
    option2: json["option2"] == null ? null : Option.fromJson(json["option2"]),
    option3: json["option3"] == null ? null : Option.fromJson(json["option3"]),
    option4: json["option4"] == null ? null : Option.fromJson(json["option4"]),
    option5: json["option5"] == null ? null : Option.fromJson(json["option5"]),
    option6: json["option6"] == null ? null : Option.fromJson(json["option6"]),
    answer: json["answer"] == null ? null : Answer.fromJson(json["answer"]),
    isDeleted: json["isDeleted"],
    assignment: json["assignment"],
    type: json["type"],
    subtype: json["subtype"],
    marks: json["marks"],
    title: json["title"],
    mediaFile: json["mediaFile"],
    description: json["description"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    questionNo: json["questionNo"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "option1": option1?.toJson(),
    "option2": option2?.toJson(),
    "option3": option3?.toJson(),
    "option4": option4?.toJson(),
    "option5": option5?.toJson(),
    "option6": option6?.toJson(),
    "answer": answer?.toJson(),
    "isDeleted": isDeleted,
    "assignment": assignment,
    "type": type,
    "subtype": subtype,
    "marks": marks,
    "title": title,
    "mediaFile": mediaFile,
    "description": description,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "questionNo": questionNo,
  };
}

class Answer {
  String? text;
  String? file;
  String? option;
  List<String>? multiOption;

  Answer({
    this.text,
    this.file,
    this.option,
    this.multiOption,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    text: json["text"],
    file: json["file"],
    option: json["option"],
    multiOption: json["multiOption"] == null ? [] : List<String>.from(json["multiOption"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "file": file,
    "option": option,
    "multiOption": multiOption == null ? [] : List<dynamic>.from(multiOption!.map((x) => x)),
  };
}

class Option {
  String? text;
  String? file;

  Option({
    this.text,
    this.file,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    text: json["text"],
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "file": file,
  };
}

class Pagination {
  Pagination();

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
  );

  Map<String, dynamic> toJson() => {
  };
}
