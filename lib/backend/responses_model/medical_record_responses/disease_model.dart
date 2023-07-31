class Disease {
  List<DiseaseData>? infection;
  List<DiseaseData>? condition;
  List<DiseaseData>? history;

  Disease({this.infection, this.condition, this.history});

  Disease.fromJson(Map<String, dynamic> json) {
    if (json['Infection'] != null) {
      infection = <DiseaseData>[];
      json['Infection'].forEach((v) {
        infection?.add(DiseaseData.fromJson(v));
      });
    }
    if (json['Condition'] != null) {
      condition = <DiseaseData>[];
      json['Condition'].forEach((v) {
        condition?.add(DiseaseData.fromJson(v));
      });
    }
    if (json['History'] != null) {
      history = <DiseaseData>[];
      json['History'].forEach((v) {
        history?.add(DiseaseData.fromJson(v));
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

class DiseaseData {
  String? sId;
  String? name;
  bool? active;
  String? document;

  DiseaseData({this.sId, this.name, this.active, this.document});

  DiseaseData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    active = json['active'];
    document = json['document'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['active'] = active;
    data['document'] = document;
    return data;
  }
}
