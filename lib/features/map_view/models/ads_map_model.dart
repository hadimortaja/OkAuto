class AdsMapModel {
  final int? code;
  final bool? status;
  final String? message;
  final List<DataAdsMap>? data;

  AdsMapModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  AdsMapModel.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => DataAdsMap.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList()
      };
}

class DataAdsMap {
  final int? id;
  final int? userId;
  final int? categoryId;
  final int? secondCategory;
  final int? cityId;
  final int? planId;
  final dynamic brandId;
  final dynamic styleId;
  final dynamic colorId;
  final dynamic name;
  final String? slug;
  final String? photo;
  final String? price;
  final dynamic priceDaily;
  final dynamic priceMonthly;
  final dynamic priceYearly;
  final String? content;
  final String? typeProduct;
  final String? condition;
  final dynamic productionYear;
  final dynamic kilometer;
  final String? address;
  final String? phone;
  final String? whatsapp;
  final String? description;
  final int? status;
  final int? active;
  final int? views;
  final int? republish;
  final String? createdAt;
  final String? updatedAt;
  final int? vendorId;
  final String? vehicleType;
  final String? numberType;
  final String? vehicleNumber;
  final String? code;
  final dynamic simType;
  final int? soldOut;
  final String? republishedAt;
  final dynamic locationLong;
  final dynamic locationLat;
  final City? city;
  final dynamic vendor;
  final dynamic color;

  DataAdsMap({
    this.id,
    this.userId,
    this.categoryId,
    this.secondCategory,
    this.cityId,
    this.planId,
    this.brandId,
    this.styleId,
    this.colorId,
    this.name,
    this.slug,
    this.photo,
    this.price,
    this.priceDaily,
    this.priceMonthly,
    this.priceYearly,
    this.content,
    this.typeProduct,
    this.condition,
    this.productionYear,
    this.kilometer,
    this.address,
    this.phone,
    this.whatsapp,
    this.description,
    this.status,
    this.active,
    this.views,
    this.republish,
    this.createdAt,
    this.updatedAt,
    this.vendorId,
    this.vehicleType,
    this.numberType,
    this.vehicleNumber,
    this.code,
    this.simType,
    this.soldOut,
    this.republishedAt,
    this.locationLong,
    this.locationLat,
    this.city,
    this.vendor,
    this.color,
  });

  DataAdsMap.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        categoryId = json['category_id'] as int?,
        secondCategory = json['second_category'] as int?,
        cityId = json['city_id'] as int?,
        planId = json['plan_id'] as int?,
        brandId = json['brand_id'],
        styleId = json['style_id'],
        colorId = json['color_id'],
        name = json['name'],
        slug = json['slug'] as String?,
        photo = json['photo'] as String?,
        price = json['price'].toString(),
        priceDaily = json['price_daily'].toString(),
        priceMonthly = json['price_monthly'].toString(),
        priceYearly = json['price_yearly'].toString(),
        content = json['content'] as String?,
        typeProduct = json['type_product'] as String?,
        condition = json['condition'] as String?,
        productionYear = json['production_year'],
        kilometer = json['kilometer'],
        address = json['address'] as String?,
        phone = json['phone'] as String?,
        whatsapp = json['whatsapp'] as String?,
        description = json['description'] as String?,
        status = json['status'] as int?,
        active = json['active'] as int?,
        views = json['views'] as int?,
        republish = json['republish'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        vendorId = json['vendor_id'] as int?,
        vehicleType = json['vehicle_type'] as String?,
        numberType = json['number_type'] as String?,
        vehicleNumber = json['vehicle_number'] as String?,
        code = json['code'] as String?,
        simType = json['sim_type'],
        soldOut = json['sold_out'] as int?,
        republishedAt = json['republished_at'] as String?,
        locationLong = json['location_long'],
        locationLat = json['location_lat'],
        city = (json['city'] as Map<String, dynamic>?) != null
            ? City.fromJson(json['city'] as Map<String, dynamic>)
            : null,
        vendor = json['vendor'],
        color = json['color'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'category_id': categoryId,
        'second_category': secondCategory,
        'city_id': cityId,
        'plan_id': planId,
        'brand_id': brandId,
        'style_id': styleId,
        'color_id': colorId,
        'name': name,
        'slug': slug,
        'photo': photo,
        'price': price,
        'price_daily': priceDaily,
        'price_monthly': priceMonthly,
        'price_yearly': priceYearly,
        'content': content,
        'type_product': typeProduct,
        'condition': condition,
        'production_year': productionYear,
        'kilometer': kilometer,
        'address': address,
        'phone': phone,
        'whatsapp': whatsapp,
        'description': description,
        'status': status,
        'active': active,
        'views': views,
        'republish': republish,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'vendor_id': vendorId,
        'vehicle_type': vehicleType,
        'number_type': numberType,
        'vehicle_number': vehicleNumber,
        'code': code,
        'sim_type': simType,
        'sold_out': soldOut,
        'republished_at': republishedAt,
        'location_long': locationLong,
        'location_lat': locationLat,
        'city': city?.toJson(),
        'vendor': vendor,
        'color': color
      };
}

class City {
  final int? id;
  final String? name;
  final String? nameEn;
  final String? createdAt;
  final String? updatedAt;
  final String? logo;
  final String? normalPlat;
  final dynamic classicPlat;
  final String? motorPlat;

  City({
    this.id,
    this.name,
    this.nameEn,
    this.createdAt,
    this.updatedAt,
    this.logo,
    this.normalPlat,
    this.classicPlat,
    this.motorPlat,
  });

  City.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        nameEn = json['name_en'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        logo = json['logo'] as String?,
        normalPlat = json['normal_plat'] as String?,
        classicPlat = json['classic_plat'],
        motorPlat = json['motor_plat'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_en': nameEn,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'logo': logo,
        'normal_plat': normalPlat,
        'classic_plat': classicPlat,
        'motor_plat': motorPlat
      };
}
