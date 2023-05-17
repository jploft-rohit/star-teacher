class StickyNotesListResponse {
  dynamic statusCode;
  dynamic message;
  List<StickyNotesData>? data;
  Pagination? pagination;

  StickyNotesListResponse(
      {this.statusCode, this.message, this.data, this.pagination});

  StickyNotesListResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StickyNotesData>[];
      json['data'].forEach((v) {
        data!.add(new StickyNotesData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
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

class StickyNotesData {
  dynamic sId;
  dynamic isDeleted;
  dynamic user;
  dynamic color;
  dynamic title;
  dynamic description;
  dynamic status;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  Status? noteStatus;
  Reminder? reminder;

  StickyNotesData(
      {this.sId,
        this.isDeleted,
        this.user,
        this.color,
        this.title,
        this.status,
        this.description,
        this.noteStatus,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.reminder});

  StickyNotesData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    user = json['user'];
    color = json['color'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    noteStatus = json['status'] != null ? new Status.fromJson(json['status']) : null;
    iV = json['__v'];
    reminder = json['reminder'] != null
        ? new Reminder.fromJson(json['reminder'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['user'] = this.user;
    data['color'] = this.color;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.noteStatus != null) {
      data['status'] = this.noteStatus!.toJson();
    }
    data['__v'] = this.iV;
    if (this.reminder != null) {
      data['reminder'] = this.reminder!.toJson();
    }
    return data;
  }
}

class Reminder {
  dynamic sId;
  dynamic stickyNote;
  dynamic forType;
  dynamic isDeleted;
  dynamic type;
  dynamic time;
  dynamic remider;
  dynamic title;
  dynamic description;
  dynamic typeValue;
  dynamic date;
  dynamic user;
  dynamic student;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  Reminder(
      {this.sId,
        this.stickyNote,
        this.forType,
        this.isDeleted,
        this.type,
        this.time,
        this.remider,
        this.title,
        this.description,
        this.typeValue,
        this.date,
        this.user,
        this.student,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Reminder.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    stickyNote = json['stickyNote'];
    forType = json['forType'];
    isDeleted = json['isDeleted'];
    type = json['type'];
    time = json['time'];
    remider = json['remider'];
    title = json['title'];
    description = json['description'];
    typeValue = json['typeValue'];
    date = json['date'];
    user = json['user'];
    student = json['student'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['stickyNote'] = this.stickyNote;
    data['forType'] = this.forType;
    data['isDeleted'] = this.isDeleted;
    data['type'] = this.type;
    data['time'] = this.time;
    data['remider'] = this.remider;
    data['title'] = this.title;
    data['description'] = this.description;
    data['typeValue'] = this.typeValue;
    data['date'] = this.date;
    data['user'] = this.user;
    data['student'] = this.student;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    data['nextPage'] = this.nextPage;
    data['prevPage'] = this.prevPage;
    return data;
  }
}

class Status {
  dynamic sId;
  dynamic isDeleted;
  dynamic name;
  dynamic type;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  bool? isChecked;

  Status(
      {this.sId,
        this.isDeleted,
        this.name,
        this.type,
        this.isChecked,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Status.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    type = json['type'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['type'] = this.type;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}