import 'dart:convert';

class CategoryIndividualListModel {
  String? status;
  double? avgOverallRating;
  List<Service>? services;

  CategoryIndividualListModel({
    this.status,
    this.avgOverallRating,
    this.services,
  });

  factory CategoryIndividualListModel.fromRawJson(String str) => CategoryIndividualListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryIndividualListModel.fromJson(Map<String, dynamic> json) => CategoryIndividualListModel(
    status: json["status"],
    avgOverallRating: json["avg_overall_rating"]?.toDouble(),
    services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "avg_overall_rating": avgOverallRating,
    "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
  };
}

class Service {
  int? serviceId;
  String? serviceName;
  double? avgServiceRating;
  ServiceDetails? serviceDetails;

  Service({
    this.serviceId,
    this.serviceName,
    this.avgServiceRating,
    this.serviceDetails,
  });

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    serviceId: json["service_id"],
    serviceName: json["service_name"],
    avgServiceRating: json["avg_service_rating"]?.toDouble(),
    serviceDetails: json["service_details"] == null ? null : ServiceDetails.fromJson(json["service_details"]),
  );

  Map<String, dynamic> toJson() => {
    "service_id": serviceId,
    "service_name": serviceName,
    "avg_service_rating": avgServiceRating,
    "service_details": serviceDetails?.toJson(),
  };
}

class ServiceDetails {
  int? id;
  int? categoryId;
  int? providerId;
  String? serviceName;
  List<String>? gallaryPhoto;
  String? serviceDuration;
  String? salonServiceCharge;
  String? homeServiceCharge;

  ServiceDetails({
    this.id,
    this.categoryId,
    this.providerId,
    this.serviceName,
    this.gallaryPhoto,
    this.serviceDuration,
    this.salonServiceCharge,
    this.homeServiceCharge,
  });

  factory ServiceDetails.fromRawJson(String str) => ServiceDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceDetails.fromJson(Map<String, dynamic> json) => ServiceDetails(
    id: json["id"],
    categoryId: json["category_id"],
    providerId: json["provider_id"],
    serviceName: json["service_name"],
    gallaryPhoto: json["gallary_photo"] == null ? [] : List<String>.from(json["gallary_photo"]!.map((x) => x)),
    serviceDuration: json["service_duration"],
    salonServiceCharge: json["salon_service_charge"],
    homeServiceCharge: json["home_service_charge"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "provider_id": providerId,
    "service_name": serviceName,
    "gallary_photo": gallaryPhoto == null ? [] : List<dynamic>.from(gallaryPhoto!.map((x) => x)),
    "service_duration": serviceDuration,
    "salon_service_charge": salonServiceCharge,
    "home_service_charge": homeServiceCharge,
  };
}
