import 'dart:convert';

class AppointmentModel {
  List<Datum>? data;
  Pagination? pagination;

  AppointmentModel({
    this.data,
    this.pagination,
  });

  factory AppointmentModel.fromRawJson(String str) => AppointmentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => AppointmentModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Datum {
  int? id;
  int? userId;
  int? providerId;
  List<Service>? service;
  dynamic catalougeId;
  String? serviceType;
  String? serviceDuration;
  String? price;
  String? date;
  String? time;
  int? status;
  int? advanceMoney;
  DateTime? createdAt;
  DateTime? updatedAt;
  Provider? provider;
  List<CatalogDetail>? catalogDetails;

  Datum({
    this.id,
    this.userId,
    this.providerId,
    this.service,
    this.catalougeId,
    this.serviceType,
    this.serviceDuration,
    this.price,
    this.date,
    this.time,
    this.status,
    this.advanceMoney,
    this.createdAt,
    this.updatedAt,
    this.provider,
    this.catalogDetails,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    providerId: json["provider_id"],
    service: json["service"] == null ? [] : List<Service>.from(json["service"]!.map((x) => Service.fromJson(x))),
    catalougeId: json["catalouge_id"],
    serviceType: json["service_type"],
    serviceDuration: json["service_duration"],
    price: json["price"],
    date: json["date"],
    time: json["time"],
    status: json["status"],
    advanceMoney: json["advance_money"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    provider: json["provider"] == null ? null : Provider.fromJson(json["provider"]),
    catalogDetails: json["catalog_details"] == null ? [] : List<CatalogDetail>.from(json["catalog_details"]!.map((x) => CatalogDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "provider_id": providerId,
    "service": service == null ? [] : List<dynamic>.from(service!.map((x) => x.toJson())),
    "catalouge_id": catalougeId,
    "service_type": serviceType,
    "service_duration": serviceDuration,
    "price": price,
    "date": date,
    "time": time,
    "status": status,
    "advance_money": advanceMoney,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "provider": provider?.toJson(),
    "catalog_details": catalogDetails == null ? [] : List<dynamic>.from(catalogDetails!.map((x) => x.toJson())),
  };
}

class CatalogDetail {
  int? id;
  int? providerId;
  int? serviceId;
  String? catalogName;
  String? catalogDescription;
  String? image;
  String? serviceDuration;
  String? salonServiceCharge;
  String? homeServiceCharge;
  String? bookingMoney;
  String? serviceHour;
  DateTime? createdAt;
  DateTime? updatedAt;

  CatalogDetail({
    this.id,
    this.providerId,
    this.serviceId,
    this.catalogName,
    this.catalogDescription,
    this.image,
    this.serviceDuration,
    this.salonServiceCharge,
    this.homeServiceCharge,
    this.bookingMoney,
    this.serviceHour,
    this.createdAt,
    this.updatedAt,
  });

  factory CatalogDetail.fromRawJson(String str) => CatalogDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CatalogDetail.fromJson(Map<String, dynamic> json) => CatalogDetail(
    id: json["id"],
    providerId: json["provider_id"],
    serviceId: json["service_id"],
    catalogName: json["catalog_name"],
    catalogDescription: json["catalog_description"],
    image: json["image"],
    serviceDuration: json["service_duration"],
    salonServiceCharge: json["salon_service_charge"],
    homeServiceCharge: json["home_service_charge"],
    bookingMoney: json["booking_money"],
    serviceHour: json["service_hour"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "provider_id": providerId,
    "service_id": serviceId,
    "catalog_name": catalogName,
    "catalog_description": catalogDescription,
    "image": image,
    "service_duration": serviceDuration,
    "salon_service_charge": salonServiceCharge,
    "home_service_charge": homeServiceCharge,
    "booking_money": bookingMoney,
    "service_hour": serviceHour,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Provider {
  int? id;
  int? userId;
  int? categoryId;
  String? businessName;
  String? address;
  String? description;
  String? availableServiceOur;
  String? coverPhoto;
  String? latitude;
  String? longitude;
  String? gallaryPhoto;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Provider({
    this.id,
    this.userId,
    this.categoryId,
    this.businessName,
    this.address,
    this.description,
    this.availableServiceOur,
    this.coverPhoto,
    this.latitude,
    this.longitude,
    this.gallaryPhoto,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Provider.fromRawJson(String str) => Provider.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
    id: json["id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    businessName: json["business_name"],
    address: json["address"],
    description: json["description"],
    availableServiceOur: json["available_service_our"],
    coverPhoto: json["cover_photo"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    gallaryPhoto: json["gallary_photo"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category_id": categoryId,
    "business_name": businessName,
    "address": address,
    "description": description,
    "available_service_our": availableServiceOur,
    "cover_photo": coverPhoto,
    "latitude": latitude,
    "longitude": longitude,
    "gallary_photo": gallaryPhoto,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Service {
  int? serviceId;
  int? catalougeId;

  Service({
    this.serviceId,
    this.catalougeId,
  });

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    serviceId: json["service_id"],
    catalougeId: json["catalouge_id"],
  );

  Map<String, dynamic> toJson() => {
    "service_id": serviceId,
    "catalouge_id": catalougeId,
  };
}

class Pagination {
  int? currentPage;
  int? totalPages;
  int? perPage;
  int? total;
  dynamic nextPageUrl;
  dynamic prevPageUrl;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.perPage,
    this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
    perPage: json["per_page"],
    total: json["total"],
    nextPageUrl: json["next_page_url"],
    prevPageUrl: json["prev_page_url"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "total_pages": totalPages,
    "per_page": perPage,
    "total": total,
    "next_page_url": nextPageUrl,
    "prev_page_url": prevPageUrl,
  };
}
