class WishlistModel {
  final int? code;
  final bool? status;
  final String? message;
  final Data? data;

  WishlistModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  WishlistModel.fromJson(Map<String, dynamic> json)
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
  final List<DataWishlist>? data;
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
            ?.map(
                (dynamic e) => DataWishlist.fromJson(e as Map<String, dynamic>))
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

class DataWishlist {
  final int? id;
  final int? userId;
  final int? productId;
  final String? createdAt;
  final String? updatedAt;
  final Product? product;

  DataWishlist({
    this.id,
    this.userId,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  DataWishlist.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        productId = json['product_id'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        product = (json['product'] as Map<String, dynamic>?) != null
            ? Product.fromJson(json['product'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'product_id': productId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'product': product?.toJson()
      };
}

class Product {
  final int? id;
  final int? userId;
  final int? categoryId;
  final int? secondCategory;
  final int? cityId;
  final int? planId;
  final int? brandId;
  final int? styleId;
  final int? colorId;
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
  final String? productionYear;
  final String? kilometer;
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
  final String? republishedAt;
  final City? city;
  final Brand? brand;

  Product({
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
    this.city,
    this.brand,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        categoryId = json['category_id'] as int?,
        secondCategory = json['second_category'] as int?,
        cityId = json['city_id'] as int?,
        planId = json['plan_id'] as int?,
        brandId = json['brand_id'] as int?,
        styleId = json['style_id'] as int?,
        colorId = json['color_id'] as int?,
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
        productionYear = json['production_year'] as String?,
        kilometer = json['kilometer'] as String?,
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
        republishedAt = json['republished_at'] as String?,
        city = (json['city'] as Map<String, dynamic>?) != null
            ? City.fromJson(json['city'] as Map<String, dynamic>)
            : null,
        brand = (json['brand'] as Map<String, dynamic>?) != null
            ? Brand.fromJson(json['brand'] as Map<String, dynamic>)
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
        'republished_at': republishedAt,
        'city': city?.toJson(),
        'brand': brand?.toJson()
      };
}

class City {
  final int? id;
  final String? name;
  final String? nameEn;
  final String? createdAt;
  final String? updatedAt;
  final String? logo;
  final dynamic normalPlat;
  final dynamic classicPlat;
  final String? currency;

  City({
    this.id,
    this.name,
    this.nameEn,
    this.createdAt,
    this.updatedAt,
    this.logo,
    this.normalPlat,
    this.classicPlat,
    this.currency,
  });

  City.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        nameEn = json['name_en'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        logo = json['logo'] as String?,
        normalPlat = json['normal_plat'],
        classicPlat = json['classic_plat'],
        currency = json['currency'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_en': nameEn,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'logo': logo,
        'normal_plat': normalPlat,
        'classic_plat': classicPlat,
        'currency': currency
      };
}

class Brand {
  final int? id;
  final String? name;
  final dynamic nameAr;
  final String? logo;
  final String? createdAt;
  final String? updatedAt;
  final int? makeId;
  final dynamic type;

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
        type = json['type'];

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
