import 'package:car_rental/features/upload_ads_customer_view/data/models/categories_ads_model.dart';

class MyAdsModel {
  final int? code;
  final bool? status;
  final String? message;
  final Data? data;

  MyAdsModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  MyAdsModel.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'message': message,
        'data': data?.toJson()
      };
}

class Data {
  final int? currentPage;
  final List<DataAds>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Links>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  Data.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'] as int?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => DataAds.fromJson(e as Map<String, dynamic>))
            .toList(),
        firstPageUrl = json['first_page_url'] as String?,
        from = json['from'] as int?,
        lastPage = json['last_page'] as int?,
        lastPageUrl = json['last_page_url'] as String?,
        links = (json['links'] as List?)
            ?.map((dynamic e) => Links.fromJson(e as Map<String, dynamic>))
            .toList(),
        nextPageUrl = json['next_page_url'],
        path = json['path'] as String?,
        perPage = json['per_page'] as int?,
        prevPageUrl = json['prev_page_url'],
        to = json['to'] as int?,
        total = json['total'] as int?;

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'data': data?.map((e) => e.toJson()).toList(),
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'links': links?.map((e) => e.toJson()).toList(),
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total
      };
}

class DataAds {
  final int? id;
  final int? userId;
  final int? categoryId;
  final int? secondCategory;
  final int? cityId;
  final int? planId;
  final dynamic brandId;
  final dynamic styleId;
  final dynamic colorId;
  final String? name;
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
  final dynamic vehicleType;
  final dynamic numberType;
  final dynamic vehicleNumber;
  final dynamic code;
  final dynamic simType;
  final int? soldOut;
  final Plan? plan;
  final DataCategoryAds? category;
  final List<Pictures>? pictures;
  final City? city;
  final Brand? brand;
  final Color? color;
  final Style? style;
  DataAds({
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
    this.plan,
    this.category,
    this.pictures,
    this.city,
    this.brand,
    this.color,
    this.style,
  });

  DataAds.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        categoryId = json['category_id'] as int?,
        secondCategory = json['second_category'] as int?,
        cityId = json['city_id'] as int?,
        planId = json['plan_id'] as int?,
        brandId = json['brand_id'],
        styleId = json['style_id'],
        colorId = json['color_id'],
        name = json['name'] as String?,
        slug = json['slug'] as String?,
        photo = json['photo'] as String?,
        price = json['price'].toString(),
        priceDaily = json['price_daily'],
        priceMonthly = json['price_monthly'],
        priceYearly = json['price_yearly'],
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
        vehicleType = json['vehicle_type'],
        numberType = json['number_type'],
        vehicleNumber = json['vehicle_number'],
        code = json['code'],
        simType = json['sim_type'],
        soldOut = json['sold_out'] as int?,
        plan = (json['plan'] as Map<String, dynamic>?) != null
            ? Plan.fromJson(json['plan'] as Map<String, dynamic>)
            : null,
        category = (json['category'] as Map<String, dynamic>?) != null
            ? DataCategoryAds.fromJson(json['category'] as Map<String, dynamic>)
            : null,
        pictures = (json['pictures'] as List?)
            ?.map((dynamic e) => Pictures.fromJson(e as Map<String, dynamic>))
            .toList(),
        city = (json['city'] as Map<String, dynamic>?) != null
            ? City.fromJson(json['city'] as Map<String, dynamic>)
            : null,
        brand = (json['brand'] as Map<String, dynamic>?) != null
            ? Brand.fromJson(json['brand'] as Map<String, dynamic>)
            : null,
        color = (json['color'] as Map<String, dynamic>?) != null
            ? Color.fromJson(json['color'] as Map<String, dynamic>)
            : null,
        style = (json['style'] as Map<String, dynamic>?) != null
            ? Style.fromJson(json['style'] as Map<String, dynamic>)
            : null;
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
        'plan': plan?.toJson(),
        'category': category?.toJson(),
        'pictures': pictures?.map((e) => e.toJson()).toList(),
        'city': city?.toJson(),
        'brand': brand?.toJson(),
        'color': color?.toJson(),
        'style': style?.toJson(),
      };
}

class Plan {
  final int? id;
  final String? title;
  final int? resentCount;
  final int? special;
  final String? createdAt;
  final String? updatedAt;

  Plan({
    this.id,
    this.title,
    this.resentCount,
    this.special,
    this.createdAt,
    this.updatedAt,
  });

  Plan.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        resentCount = json['resent_count'] as int?,
        special = json['special'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'resent_count': resentCount,
        'special': special,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}

class Category {
  final int? id;
  final String? name;
  final String? slug;
  final String? photo;
  final String? createdAt;
  final String? updatedAt;
  final int? serviceId;
  final int? parentId;

  Category({
    this.id,
    this.name,
    this.slug,
    this.photo,
    this.createdAt,
    this.updatedAt,
    this.serviceId,
    this.parentId,
  });

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        slug = json['slug'] as String?,
        photo = json['photo'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        serviceId = json['service_id'] as int?,
        parentId = json['parent_id'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'photo': photo,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'service_id': serviceId,
        'parent_id': parentId
      };
}

class Pictures {
  final int? id;
  final String? productId;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  Pictures({
    this.id,
    this.productId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  Pictures.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        productId = json['product_id'].toString(),
        image = json['image'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'image': image,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}

class City {
  final int? id;
  final String? name;
  final String? nameEn;
  final String? createdAt;
  final String? updatedAt;
  final String? logo;
  final String? currency;

  City({
    this.id,
    this.name,
    this.nameEn,
    this.createdAt,
    this.updatedAt,
    this.logo,
    this.currency,
  });

  City.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        nameEn = json['name_en'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        logo = json['logo'] as String?,
        currency = json['currency'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_en': nameEn,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'logo': logo,
        'currency': currency
      };
}

class Color {
  final int? id;
  final String? name;
  final String? nameEn;

  final String? code;
  final String? createdAt;
  final String? updatedAt;

  Color({
    this.id,
    this.name,
    this.nameEn,
    this.code,
    this.createdAt,
    this.updatedAt,
  });

  Color.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        nameEn = json['name_en'] as String?,
        code = json['code'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_en': nameEn,
        'code': code,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}

class Links {
  final dynamic url;
  final String? label;
  final bool? active;

  Links({
    this.url,
    this.label,
    this.active,
  });

  Links.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        label = json['label'] as String?,
        active = json['active'] as bool?;

  Map<String, dynamic> toJson() =>
      {'url': url, 'label': label, 'active': active};
}

class Brand {
  final int? id;
  final String? name;
  final dynamic nameAr;
  final String? logo;
  final String? createdAt;
  final String? updatedAt;
  final int? makeId;
  final String? type;

  Brand({
    this.id,
    this.name,
    this.nameAr,
    this.logo,
    this.createdAt,
    this.updatedAt,
    this.makeId,
    this.type,
  });

  Brand.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        nameAr = json['name_ar'],
        logo = json['logo'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        makeId = json['MakeId'] as int?,
        type = json['type'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_ar': nameAr,
        'logo': logo,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'MakeId': makeId,
        'type': type
      };
}

class Style {
  final int? id;
  final int? brandId;
  final String? name;
  final dynamic nameAr;
  final dynamic photo;
  final String? createdAt;
  final String? updatedAt;
  final int? modelID;
  final dynamic type;

  Style({
    this.id,
    this.brandId,
    this.name,
    this.nameAr,
    this.photo,
    this.createdAt,
    this.updatedAt,
    this.modelID,
    this.type,
  });

  Style.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        brandId = json['brand_id'] as int?,
        name = json['name'] as String?,
        nameAr = json['name_ar'],
        photo = json['photo'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        modelID = json['Model_ID'] as int?,
        type = json['type'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'brand_id': brandId,
        'name': name,
        'name_ar': nameAr,
        'photo': photo,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'Model_ID': modelID,
        'type': type
      };
}
