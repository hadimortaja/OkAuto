class CitiesModel {
  final int? code;
  final bool? status;
  final String? message;
  final List<DataCity>? data;

  CitiesModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  CitiesModel.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => DataCity.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList()
      };
}

class DataCity {
  final int? id;
  final String? name;
  final String? nameEn;
  final String? createdAt;
  final String? updatedAt;
  final String? logo;

  DataCity({
    this.id,
    this.name,
    this.nameEn,
    this.createdAt,
    this.updatedAt,
    this.logo,
  });

  DataCity.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        nameEn = json['name_en'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        logo = json['logo'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_en': nameEn,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'logo': logo
      };
}
