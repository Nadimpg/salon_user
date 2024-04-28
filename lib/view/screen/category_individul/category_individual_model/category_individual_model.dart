import 'dart:convert';

class CategoryIndividualModel {
  String? status;
  List<ProviderDatum>? providerData;

  CategoryIndividualModel({
    this.status,
    this.providerData,
  });

  factory CategoryIndividualModel.fromRawJson(String str) => CategoryIndividualModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryIndividualModel.fromJson(Map<String, dynamic> json) => CategoryIndividualModel(
    status: json["status"],
    providerData: json["provider_data"] == null ? [] : List<ProviderDatum>.from(json["provider_data"]!.map((x) => ProviderDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "provider_data": providerData == null ? [] : List<dynamic>.from(providerData!.map((x) => x.toJson())),
  };
}

class ProviderDatum {
  int? id;
  num? avgRating;
  double? distance;
  ProviderDetails? providerDetails;

  ProviderDatum({
    this.id,
    this.avgRating,
    this.distance,
    this.providerDetails,
  });

  factory ProviderDatum.fromRawJson(String str) => ProviderDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProviderDatum.fromJson(Map<String, dynamic> json) => ProviderDatum(
    id: json["id"],
    avgRating: json["avg_rating"],
    distance: json["distance"]?.toDouble(),
    providerDetails: json["provider_details"] == null ? null : ProviderDetails.fromJson(json["provider_details"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avg_rating": avgRating,
    "distance": distance,
    "provider_details": providerDetails?.toJson(),
  };
}

class ProviderDetails {
  int? id;
  int? userId;
  int? categoryId;
  String? businessName;
  String? address;
  String? description;
  String? coverPhoto;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? latitude;
  String? longitude;
  double? distance;

  ProviderDetails({
    this.id,
    this.userId,
    this.categoryId,
    this.businessName,
    this.address,
    this.description,
    this.coverPhoto,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.distance,
  });

  factory ProviderDetails.fromRawJson(String str) => ProviderDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProviderDetails.fromJson(Map<String, dynamic> json) => ProviderDetails(
    id: json["id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    businessName: json["business_name"],
    address: json["address"],
    description: json["description"],
    coverPhoto: json["cover_photo"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    latitude: json["latitude"],
    longitude: json["longitude"],
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category_id": categoryId,
    "business_name": businessName,
    "address": address,
    "description": description,
    "cover_photo": coverPhoto,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "latitude": latitude,
    "longitude": longitude,
    "distance": distance,
  };
}
