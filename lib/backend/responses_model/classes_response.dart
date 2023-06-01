class ClassesResponse {
	List<ClassData>? data;
	dynamic success;
	dynamic statusCode;
	dynamic message;

	ClassesResponse({this.data, this.success, this.statusCode, this.message});

	ClassesResponse.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = <ClassData>[];
			json['data'].forEach((v) { data!.add(new ClassData.fromJson(v)); });
		}
		success = json['success'];
		statusCode = json['statusCode'];
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
			data['data'] = this.data!.map((v) => v.toJson()).toList();
		}
		data['success'] = this.success;
		data['statusCode'] = this.statusCode;
		data['message'] = this.message;
		return data;
	}
}

class ClassData {
	dynamic sId;
	dynamic school;
	dynamic name;
	dynamic status;
	dynamic createdBy;
	dynamic createdAt;
	dynamic updatedAt;
	dynamic iV;
	dynamic updatedBy;
	List<Trans>? trans;

	ClassData({this.sId, this.school, this.name, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy, this.trans});

	ClassData.fromJson(Map<String, dynamic> json) {
		sId = json['_id'];
		school = json['school'];
		name = json['name'];
		status = json['status'];
		createdBy = json['createdBy'];
		createdAt = json['createdAt'];
		updatedAt = json['updatedAt'];
		iV = json['__v'];
		updatedBy = json['updatedBy'];
		if (json['trans'] != null) {
			trans = <Trans>[];
			json['trans'].forEach((v) { trans!.add(new Trans.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['_id'] = this.sId;
		data['school'] = this.school;
		data['name'] = this.name;
		data['status'] = this.status;
		data['createdBy'] = this.createdBy;
		data['createdAt'] = this.createdAt;
		data['updatedAt'] = this.updatedAt;
		data['__v'] = this.iV;
		data['updatedBy'] = this.updatedBy;
		if (this.trans != null) {
			data['trans'] = this.trans!.map((v) => v.toJson()).toList();
		}
		return data;
	}
}

class Trans {
	dynamic sId;
	dynamic name;
	dynamic language;
	dynamic classes;
	dynamic iV;

	Trans({this.sId, this.name, this.language, this.classes, this.iV});

	Trans.fromJson(Map<String, dynamic> json) {
	sId = json['_id'];
	name = json['name'];
	language = json['language'];
	classes = json['class'];
	iV = json['__v'];
	}

	Map<String, dynamic> toJson() {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = this.sId;
	data['name'] = this.name;
	data['language'] = this.language;
	data['class'] = this.classes;
	data['__v'] = this.iV;
	return data;
	}
}
