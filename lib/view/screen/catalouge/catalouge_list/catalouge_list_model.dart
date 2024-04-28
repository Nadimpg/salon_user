import 'dart:convert';

class CatalougeListModel {
  String? status;
  double? avgRating;
  List<Catalog>? catalog;

  CatalougeListModel({
    this.status,
    this.avgRating,
    this.catalog,
  });

  factory CatalougeListModel.fromRawJson(String str) => CatalougeListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CatalougeListModel.fromJson(Map<String, dynamic> json) => CatalougeListModel(
    status: json["status"],
    avgRating: json["avg_rating"]?.toDouble(),
    catalog: json["catalog"] == null ? [] : List<Catalog>.from(json["catalog"]!.map((x) => Catalog.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "avg_rating": avgRating,
    "catalog": catalog == null ? [] : List<dynamic>.from(catalog!.map((x) => x.toJson())),
  };
}

class Catalog {
  int? id;
  int? providerId;
  int? serviceId;
  String? catalogName;
  String? catalogDescription;
  List<String>? image;
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
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
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
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "service_duration": serviceDuration,
    "salon_service_charge": salonServiceCharge,
    "home_service_charge": homeServiceCharge,
    "booking_money": bookingMoney,
    "service_hour": serviceHour,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
