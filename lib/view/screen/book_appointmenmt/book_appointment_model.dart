import 'dart:convert';

class BookAppointmentModel {
  String? status;
  int? totalReview;
  num? avgRating;
  Parcentage? parcentage;
  Provider? provider;

  BookAppointmentModel({
    this.status,
    this.totalReview,
    this.avgRating,
    this.parcentage,
    this.provider,
  });

  factory BookAppointmentModel.fromRawJson(String str) => BookAppointmentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookAppointmentModel.fromJson(Map<String, dynamic> json) => BookAppointmentModel(
    status: json["status"],
    totalReview: json["totalReview"],
    avgRating: json["avg_rating"],
    parcentage: json["parcentage"] == null ? null : Parcentage.fromJson(json["parcentage"]),
    provider: json["provider"] == null ? null : Provider.fromJson(json["provider"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalReview": totalReview ?? 0,
    "avg_rating": avgRating,
    "parcentage": parcentage?.toJson(),
    "provider": provider?.toJson(),
  };
}

class Parcentage {
  int? id;
  int? percentage;
  DateTime? createdAt;
  DateTime? updatedAt;

  Parcentage({
    this.id,
    this.percentage,
    this.createdAt,
    this.updatedAt,
  });

  factory Parcentage.fromRawJson(String str) => Parcentage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Parcentage.fromJson(Map<String, dynamic> json) => Parcentage(
    id: json["id"],
    percentage: json["percentage"] ,
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "percentage": percentage ?? 15,
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
  List<AvailableServiceOur>? availableServiceOur;
  String? coverPhoto;
  String? latitude;
  String? longitude;
  List<String>? gallaryPhoto;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Service>? services;

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
    this.services,
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
    availableServiceOur: json["available_service_our"] == null ? [] : List<AvailableServiceOur>.from(json["available_service_our"]!.map((x) => AvailableServiceOur.fromJson(x))),
    coverPhoto: json["cover_photo"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    gallaryPhoto: json["gallary_photo"] == null ? [] : List<String>.from(json["gallary_photo"]!.map((x) => x)),
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category_id": categoryId,
    "business_name": businessName,
    "address": address,
    "description": description,
    "available_service_our": availableServiceOur == null ? [] : List<dynamic>.from(availableServiceOur!.map((x) => x.toJson())),
    "cover_photo": coverPhoto,
    "latitude": latitude,
    "longitude": longitude,
    "gallary_photo": gallaryPhoto == null ? [] : List<dynamic>.from(gallaryPhoto!.map((x) => x)),
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
  };
}

class AvailableServiceOur {
  String? day;
  String? startTime;
  String? endTime;

  AvailableServiceOur({
    this.day,
    this.startTime,
    this.endTime,
  });

  factory AvailableServiceOur.fromRawJson(String str) => AvailableServiceOur.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AvailableServiceOur.fromJson(Map<String, dynamic> json) => AvailableServiceOur(
    day: json["Day"],
    startTime: json["Start Time"],
    endTime: json["End Time"],
  );

  Map<String, dynamic> toJson() => {
    "Day": day,
    "Start Time": startTime,
    "End Time": endTime,
  };
}

class Service {
  int? id;
  int? categoryId;
  int? providerId;
  String? serviceName;
  String? serviceDescription;
  String? gallaryPhoto;
  String? serviceDuration;
  String? salonServiceCharge;
  String? homeServiceCharge;
  String? setBookingMony;
  String? availableServiceOur;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Catalog>? catalog;

  Service({
    this.id,
    this.categoryId,
    this.providerId,
    this.serviceName,
    this.serviceDescription,
    this.gallaryPhoto,
    this.serviceDuration,
    this.salonServiceCharge,
    this.homeServiceCharge,
    this.setBookingMony,
    this.availableServiceOur,
    this.createdAt,
    this.updatedAt,
    this.catalog,
  });

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    categoryId: json["category_id"],
    providerId: json["provider_id"],
    serviceName: json["service_name"],
    serviceDescription: json["service_description"],
    gallaryPhoto: json["gallary_photo"],
    serviceDuration: json["service_duration"],
    salonServiceCharge: json["salon_service_charge"],
    homeServiceCharge: json["home_service_charge"],
    setBookingMony: json["set_booking_mony"],
    availableServiceOur: json["available_service_our"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    catalog: json["catalog"] == null ? [] : List<Catalog>.from(json["catalog"]!.map((x) => Catalog.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "provider_id": providerId,
    "service_name": serviceName,
    "service_description": serviceDescription,
    "gallary_photo": gallaryPhoto,
    "service_duration": serviceDuration,
    "salon_service_charge": salonServiceCharge,
    "home_service_charge": homeServiceCharge,
    "set_booking_mony": setBookingMony,
    "available_service_our": availableServiceOur,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "catalog": catalog == null ? [] : List<dynamic>.from(catalog!.map((x) => x.toJson())),
  };
}

class Catalog {
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

  Catalog({
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

  factory Catalog.fromRawJson(String str) => Catalog.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
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


