class MedicalSurvey {
  List<String>? accessories;
  bool? isConsentMedical;
  bool? isPresentMedicalExam;
  bool? isAllergic;
  List<String>? vaccinationDose;
  bool? isChildPhotoSocialMedia;
  bool? isChildPhotoStarGallery;
  bool? isNotChildPhoto;
  bool? isAllowCanteen;
  bool? isAllergicFood;
  bool? isDeleted;
  String? sId;
  String? language;
  String? user;
  String? familyHistroy;
  String? allergiName;
  String? status;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Dieases? dieases;
  List<Foods>? foods;

  MedicalSurvey(
      {this.accessories,
      this.isConsentMedical,
      this.isPresentMedicalExam,
      this.isAllergic,
      this.vaccinationDose,
      this.isChildPhotoSocialMedia,
      this.isChildPhotoStarGallery,
      this.isNotChildPhoto,
      this.isAllowCanteen,
      this.isAllergicFood,
      this.isDeleted,
      this.sId,
      this.language,
      this.user,
      this.familyHistroy,
      this.allergiName,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.dieases,
      this.foods});

  MedicalSurvey.fromJson(Map<String, dynamic> json) {
    accessories = json['accessories'].cast<String>();
    isConsentMedical = json['isConsentMedical'];
    isPresentMedicalExam = json['isPresentMedicalExam'];
    isAllergic = json['isAllergic'];
    vaccinationDose = json['vaccinationDose'].cast<String>();
    isChildPhotoSocialMedia = json['isChildPhotoSocialMedia'];
    isChildPhotoStarGallery = json['isChildPhotoStarGallery'];
    isNotChildPhoto = json['isNotChildPhoto'];
    isAllowCanteen = json['isAllowCanteen'];
    isAllergicFood = json['isAllergicFood'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    language = json['language'];
    user = json['user'];
    familyHistroy = json['familyHistroy'];
    allergiName = json['allergiName'];
    status = json['status'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    dieases =
        json['dieases'] != null ? Dieases?.fromJson(json['dieases']) : null;
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((v) {
        foods?.add(Foods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accessories'] = accessories;
    data['isConsentMedical'] = isConsentMedical;
    data['isPresentMedicalExam'] = isPresentMedicalExam;
    data['isAllergic'] = isAllergic;
    data['vaccinationDose'] = vaccinationDose;
    data['isChildPhotoSocialMedia'] = isChildPhotoSocialMedia;
    data['isChildPhotoStarGallery'] = isChildPhotoStarGallery;
    data['isNotChildPhoto'] = isNotChildPhoto;
    data['isAllowCanteen'] = isAllowCanteen;
    data['isAllergicFood'] = isAllergicFood;
    data['isDeleted'] = isDeleted;
    data['_id'] = sId;
    data['language'] = language;
    data['user'] = user;
    data['familyHistroy'] = familyHistroy;
    data['allergiName'] = allergiName;
    data['status'] = status;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (dieases != null) {
      data['dieases'] = dieases?.toJson();
    }
    if (foods != null) {
      data['foods'] = foods?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dieases {
  List<Infection>? infection;
  List<Infection>? condition;
  List<Infection>? history;

  Dieases({this.infection, this.condition, this.history});

  Dieases.fromJson(Map<String, dynamic> json) {
    if (json['Infection'] != null) {
      infection = <Infection>[];
      json['Infection'].forEach((v) {
        infection?.add(Infection.fromJson(v));
      });
    }
    if (json['Condition'] != null) {
      condition = <Infection>[];
      json['Condition'].forEach((v) {
        condition?.add(Infection.fromJson(v));
      });
    }
    if (json['History'] != null) {
      history = <Infection>[];
      json['History'].forEach((v) {
        history?.add(Infection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (infection != null) {
      data['Infection'] = infection?.map((v) => v.toJson()).toList();
    }
    if (condition != null) {
      data['Condition'] = condition?.map((v) => v.toJson()).toList();
    }
    if (history != null) {
      data['History'] = history?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Infection {
  String? sId;
  String? diseaseId;
  String? name;
  bool? isDisease;
  String? diseaseDocument;

  Infection(
      {this.sId,
      this.diseaseId,
      this.name,
      this.isDisease,
      this.diseaseDocument});

  Infection.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    diseaseId = json['disease_id'];
    name = json['name'];
    isDisease = json['isDisease'];
    diseaseDocument = json['diseaseDocument'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['disease_id'] = diseaseId;
    data['name'] = name;
    data['isDisease'] = isDisease;
    data['diseaseDocument'] = diseaseDocument;
    return data;
  }
}

class Foods {
  bool? isAllergic;
  bool? isDeleted;
  String? sId;
  String? user;
  String? food;
  String? createdBy;
  String? updatedBy;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Foods(
      {this.isAllergic,
      this.isDeleted,
      this.sId,
      this.user,
      this.food,
      this.createdBy,
      this.updatedBy,
      this.iV,
      this.createdAt,
      this.updatedAt});

  Foods.fromJson(Map<String, dynamic> json) {
    isAllergic = json['isAllergic'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    user = json['user'];
    food = json['food'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isAllergic'] = isAllergic;
    data['isDeleted'] = isDeleted;
    data['_id'] = sId;
    data['user'] = user;
    data['food'] = food;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['__v'] = iV;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
